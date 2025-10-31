import 'package:flutter/material.dart';
import 'custom_snackbar.dart';

/// Example page demonstrating how to use the custom snackbars
class SnackBarExamplesPage extends StatelessWidget {
  const SnackBarExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom SnackBar Examples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Basic Examples
            const Text(
              'Basic Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                context.showSuccessSnackBar('Post submitted successfully!');
              },
              child: const Text('Success SnackBar'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                context.showErrorSnackBar(
                  'Failed to submit post. Please try again.',
                );
              },
              child: const Text('Error SnackBar'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                context.showWarningSnackBar('This action cannot be undone.');
              },
              child: const Text('Warning SnackBar'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                context.showInfoSnackBar(
                  'New features available in this update.',
                );
              },
              child: const Text('Info SnackBar'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                context.showLoadingSnackBar('Posting...');

                // Simulate async operation
                Future.delayed(const Duration(seconds: 2), () {
                  context.hideSnackBar();
                  context.showSuccessSnackBar('Post submitted successfully!');
                });
              },
              child: const Text('Loading SnackBar (Auto-dismiss)'),
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            // Advanced Examples
            const Text(
              'Advanced Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                CustomSnackBar(
                  message: 'Post submitted – pending approval',
                  type: SnackBarType.success,
                  duration: const Duration(seconds: 5),
                  onTap: () {
                    // Navigate to pending posts
                    debugPrint('Navigate to pending posts');
                  },
                ).show(context);
              },
              child: const Text('Success with Action Button'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                CustomSnackBar(
                  message: 'Processing your request...',
                  type: SnackBarType.info,
                  showCloseButton: true,
                  duration: const Duration(seconds: 10),
                ).show(context);
              },
              child: const Text('SnackBar with Close Button'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                CustomSnackBar(
                  message: 'Custom icon example',
                  type: SnackBarType.info,
                  customIcon: Icons.favorite,
                  duration: const Duration(seconds: 3),
                ).show(context);
              },
              child: const Text('Custom Icon'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                CustomSnackBar(
                  message: 'No internet connection',
                  type: SnackBarType.error,
                  showIcon: false,
                  duration: const Duration(seconds: 5),
                ).show(context);
              },
              child: const Text('Without Icon'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                CustomSnackBar(
                  message: 'Image uploaded',
                  type: SnackBarType.success,
                  trailing: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.image,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ).show(context);
              },
              child: const Text('With Custom Trailing Widget'),
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            // Real-world Examples
            const Text(
              'Real-world Use Cases',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                _simulatePostSubmission(context);
              },
              child: const Text('Simulate Post Submission'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                _simulateNetworkError(context);
              },
              child: const Text('Simulate Network Error'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                _simulateLikeAction(context);
              },
              child: const Text('Simulate Like Action'),
            ),
          ],
        ),
      ),
    );
  }

  /// Simulate posting with loading state
  void _simulatePostSubmission(BuildContext context) {
    // Show loading
    context.showLoadingSnackBar('Posting...');

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      context.hideSnackBar();

      // Show success with action
      CustomSnackBar(
        message: 'Post submitted – pending approval',
        type: SnackBarType.success,
        onTap: () {
          debugPrint('View pending posts');
        },
      ).show(context);
    });
  }

  /// Simulate network error with retry option
  void _simulateNetworkError(BuildContext context) {
    CustomSnackBar(
      message: 'Network error. Please try again.',
      type: SnackBarType.error,
      duration: const Duration(seconds: 5),
      onTap: () {
        debugPrint('Retry action');
        _simulatePostSubmission(context);
      },
    ).show(context);
  }

  /// Simulate like action feedback
  void _simulateLikeAction(BuildContext context) {
    context.showSuccessSnackBar(
      'Post liked!',
      duration: const Duration(seconds: 2),
    );
  }
}
