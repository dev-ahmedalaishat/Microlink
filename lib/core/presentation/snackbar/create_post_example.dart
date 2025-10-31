import 'package:flutter/material.dart';
import '../../../../core/presentation/snackbar/custom_snackbar.dart';

/// Example: Complete Create Post Page with integrated snackbars
/// This demonstrates the full flow from your screenshots
class CreatePostPageExample extends StatefulWidget {
  const CreatePostPageExample({super.key});

  @override
  State<CreatePostPageExample> createState() => _CreatePostPageExampleState();
}

class _CreatePostPageExampleState extends State<CreatePostPageExample> {
  final _textController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        actions: [
          if (!_isSubmitting)
            TextButton(onPressed: _submitPost, child: const Text('Post'))
          else
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'What\'s on your mind?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Example buttons to demonstrate different snackbar types
            const Text(
              'Test Different Scenarios:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: _submitPostSuccess,
                  child: const Text('Submit (Success)'),
                ),
                ElevatedButton(
                  onPressed: _submitPostError,
                  child: const Text('Submit (Error)'),
                ),
                ElevatedButton(
                  onPressed: _submitPostNetworkError,
                  child: const Text('Network Error'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Normal post submission with loading and success
  Future<void> _submitPost() async {
    if (_textController.text.trim().isEmpty) {
      context.showWarningSnackBar('Please enter some text');
      return;
    }

    setState(() => _isSubmitting = true);

    // Show loading snackbar
    context.showLoadingSnackBar('Posting...');

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Simulate successful submission
      await _mockApiSubmitPost(_textController.text);

      // Hide loading
      context.hideSnackBar();

      // Show success with action button (like your screenshot)
      CustomSnackBar(
        message: 'Post submitted – pending approval',
        type: SnackBarType.success,
        duration: const Duration(seconds: 4),
        onTap: () {
          // Navigate to my posts tab
          _navigateToMyPosts();
        },
      ).show(context);

      // Clear the form
      _textController.clear();

      // Optionally navigate back
      // Navigator.pop(context);
    } catch (e) {
      // Hide loading
      context.hideSnackBar();

      // Show error with retry option
      CustomSnackBar(
        message: 'Failed to submit post. Please try again.',
        type: SnackBarType.error,
        duration: const Duration(seconds: 5),
        onTap: () => _submitPost(),
      ).show(context);
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  /// Simulate successful post submission
  Future<void> _submitPostSuccess() async {
    if (_textController.text.trim().isEmpty) {
      context.showWarningSnackBar('Please enter some text');
      return;
    }

    setState(() => _isSubmitting = true);
    context.showLoadingSnackBar('Posting...');

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    context.hideSnackBar();

    // Show the exact snackbar from your screenshot
    CustomSnackBar(
      message: 'Post submitted – pending approval',
      type: SnackBarType.success,
      duration: const Duration(seconds: 4),
      onTap: () {
        _navigateToMyPosts();
      },
    ).show(context);

    _textController.clear();
    setState(() => _isSubmitting = false);
  }

  /// Simulate post submission with error
  Future<void> _submitPostError() async {
    if (_textController.text.trim().isEmpty) {
      context.showWarningSnackBar('Please enter some text');
      return;
    }

    setState(() => _isSubmitting = true);
    context.showLoadingSnackBar('Posting...');

    await Future.delayed(const Duration(seconds: 2));

    context.hideSnackBar();

    CustomSnackBar(
      message: 'Failed to submit post. Please try again.',
      type: SnackBarType.error,
      duration: const Duration(seconds: 5),
      onTap: () => _submitPostError(),
    ).show(context);

    setState(() => _isSubmitting = false);
  }

  /// Simulate network error
  Future<void> _submitPostNetworkError() async {
    if (_textController.text.trim().isEmpty) {
      context.showWarningSnackBar('Please enter some text');
      return;
    }

    setState(() => _isSubmitting = true);
    context.showLoadingSnackBar('Posting...');

    await Future.delayed(const Duration(seconds: 1));

    context.hideSnackBar();

    CustomSnackBar(
      message: 'No internet connection',
      type: SnackBarType.error,
      duration: const Duration(seconds: 5),
      customIcon: Icons.wifi_off,
      onTap: () => _submitPostNetworkError(),
    ).show(context);

    setState(() => _isSubmitting = false);
  }

  /// Mock API call
  Future<void> _mockApiSubmitPost(String content) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));

    // Simulate 90% success rate
    if (DateTime.now().millisecond % 10 == 0) {
      throw Exception('Failed to submit post');
    }
  }

  /// Navigate to My Posts tab
  void _navigateToMyPosts() {
    debugPrint('Navigating to My Posts tab');
    // Implement navigation to your "My Posts" tab
    // Example:
    // Navigator.pushReplacementNamed(context, '/home', arguments: {'tab': 1});
  }
}

/// Quick Usage Example in any existing widget
class QuickUsageExample extends StatelessWidget {
  const QuickUsageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quick Usage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Simple usage - just one line!
            ElevatedButton(
              onPressed: () {
                context.showSuccessSnackBar('Action completed!');
              },
              child: const Text('Show Success'),
            ),

            const SizedBox(height: 16),

            // With action button
            ElevatedButton(
              onPressed: () {
                CustomSnackBar(
                  message: 'Post submitted – pending approval',
                  type: SnackBarType.success,
                  onTap: () {
                    debugPrint('View tapped');
                  },
                ).show(context);
              },
              child: const Text('Show Success with Action'),
            ),

            const SizedBox(height: 16),

            // Loading state
            ElevatedButton(
              onPressed: () async {
                context.showLoadingSnackBar('Processing...');

                await Future.delayed(const Duration(seconds: 2));

                context.hideSnackBar();
                context.showSuccessSnackBar('Done!');
              },
              child: const Text('Show Loading'),
            ),
          ],
        ),
      ),
    );
  }
}
