import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:microlink/core/constants/app_constants.dart';
import 'package:microlink/core/presentation/wrapper/app_svg_picture.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';
import 'package:microlink/core/presentation/profile_avatar.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/core/theme/text_styles.dart';
import 'dart:io';

import 'package:microlink/features/social/domain/entities/create_post_params.dart';
import 'package:microlink/features/social/domain/repositories/social_repository.dart';
import 'package:microlink/features/social/presentation/widgets/svg_icon_button.dart';

class CreatePostWidget extends StatefulWidget {
  final void Function(CreatePostParams params)? onPostClick;

  const CreatePostWidget({super.key, this.onPostClick});

  @override
  State<CreatePostWidget> createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  final TextEditingController _textController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _selectedImages = [];
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final hasText = _textController.text.trim().isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    if (_selectedImages.length >= 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You can only add up to 2 images')),
      );
      return;
    }

    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _selectedImages.add(image);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to pick image: $e')));
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  void _handlePost() {
    if (_textController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter some text')));
      return;
    }

    widget.onPostClick?.call(
      CreatePostParams(
        content: _textController.text.trim(),
        mediaUrls: _selectedImages.map((img) => img.path).toList(),
      ),
    );

    _textController.clear();
    setState(() {
      _selectedImages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileAvatar(imageUrl: '', userId: loggedUserId),
        Column(
          children: [
            _buildInlineContent(context),
            _buildBottomActions(context),
          ],
        ).expanded(),
      ],
    );
  }

  Widget _buildInlineContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: 'Share something with your neighbors...',
            border: InputBorder.none,
            fillColor: Colors.transparent,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSpacing.sm,
              horizontal: AppSpacing.xs,
            ),
            isDense: true,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          maxLines: 5,
          minLines: 1,
        ),
        // Selected images
        if (_selectedImages.isNotEmpty) ...[SpacerV.m, _buildImagePreview()],
      ],
    ).paddingSymmetric(horizontal: AppSpacing.screenPadding);
  }

  Widget _buildImagePreview() {
    return SizedBox(
      height: 180,
      child: Row(
        children: [
          for (int i = 0; i < _selectedImages.length; i++)
            Container(
              margin: EdgeInsets.only(
                right: i < _selectedImages.length - 1 ? AppSpacing.sm : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(51),
                ),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppSpacing.radiusMedium,
                    ),
                    child: Image.file(
                      File(_selectedImages[i].path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () => _removeImage(i),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(52),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          size: 20,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).expanded(),
        ],
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    final canPost = _hasText;

    return Container(
      child:
          Row(
            children: [
              // Camera icon
              SvgIconButton(
                assetPath: 'assets/icons/ic_camera.svg',
                // matchTextDirection: false,
                size: AppConstants.iconM,
                onPressed: _selectedImages.length < 2
                    ? () => _pickImage(ImageSource.camera)
                    : null,
              ),
              SvgIconButton(
                assetPath: 'assets/icons/ic_gallery.svg',
                size: AppConstants.iconM,
                // matchTextDirection: false,
                onPressed: _selectedImages.length < 2
                    ? () => _pickImage(ImageSource.gallery)
                    : null,
              ),

              const Spacer(),

              // Post button
              ElevatedButton(
                onPressed: canPost ? _handlePost : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary,
                  disabledForegroundColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppSpacing.radiusMedium,
                    ),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Post',
                  style: AppTextStyles.buttonMedium.copyWith(
                    color: Colors.white,
                  ),
                ),
              ).opacity(canPost ? 1.0 : 0.2),
            ],
          ).paddingSymmetric(
            horizontal: AppSpacing.screenPadding,
            vertical: AppSpacing.md,
          ),
    );
  }
}
