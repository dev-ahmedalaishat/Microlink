# Custom SnackBar - Quick Start Guide

## 🚀 What I've Created

A complete, production-ready customizable snackbar system for your Microlink app that matches the design from your screenshots.

## 📁 Files Created

1. **`custom_snackbar.dart`** - Core snackbar implementation
2. **`snackbar_examples.dart`** - Demo page with all variations
3. **`social_integration_examples.dart`** - Practical social feature examples
4. **`create_post_example.dart`** - Complete create post flow example
5. **`README.md`** - Comprehensive documentation

## ⚡ Quick Start

### 1. Simple Usage (One-Liners)

```dart
// Success
context.showSuccessSnackBar('Post submitted successfully!');

// Error
context.showErrorSnackBar('Failed to submit post');

// Warning
context.showWarningSnackBar('Please fill all fields');

// Info
context.showInfoSnackBar('New features available');

// Loading
context.showLoadingSnackBar('Posting...');
context.hideSnackBar(); // When done
```

### 2. With Action Button (Like Your Screenshot)

```dart
CustomSnackBar(
  message: 'Post submitted – pending approval',
  type: SnackBarType.success,
  onTap: () {
    // Navigate to pending posts
  },
).show(context);
```

### 3. Complete Post Submission Flow

```dart
Future<void> submitPost() async {
  // Show loading
  context.showLoadingSnackBar('Posting...');

  try {
    await apiService.submitPost(data);

    // Hide loading & show success
    context.hideSnackBar();
    CustomSnackBar(
      message: 'Post submitted – pending approval',
      type: SnackBarType.success,
      onTap: () => navigateToMyPosts(),
    ).show(context);

  } catch (e) {
    // Hide loading & show error
    context.hideSnackBar();
    CustomSnackBar(
      message: 'Failed to submit. Please try again.',
      type: SnackBarType.error,
      onTap: () => submitPost(), // Retry
    ).show(context);
  }
}
```

## 🎨 Features

✅ 5 Types: Success, Error, Warning, Info, Loading
✅ Auto-dismissal with custom duration
✅ Action buttons (like "View")
✅ Loading spinner
✅ Custom icons
✅ Close button option
✅ Custom trailing widgets
✅ Fully customizable colors & styling

## 📱 Integration with Your App

### In Your Create Post Widget

Replace your current post submission code with:

```dart
import '../../../core/presentation/snackbar/custom_snackbar.dart';

// Then in your submit method:
context.showLoadingSnackBar('Posting...');
// ... do API call ...
context.hideSnackBar();
context.showSuccessSnackBar('Post submitted – pending approval');
```

### In Your Posts Cubit/Bloc

```dart
import '../../../core/presentation/snackbar/social_integration_examples.dart';

// Use the helper methods:
await SocialSnackBarIntegration.submitPost(
  context: context,
  content: postContent,
  submitAction: () => repository.submitPost(post),
);
```

## 🎯 Next Steps

1. **Test the Examples**: Run `SnackBarExamplesPage` to see all variations
2. **Integrate**: Add to your create post screen
3. **Customize Colors**: Modify `AppColors` in `color_palette.dart` if needed
4. **Add More**: Use as template for other features (comments, likes, etc.)

## 💡 Pro Tips

- Loading snackbars persist until manually dismissed
- Always hide loading before showing another snackbar
- Use action buttons for important user flows
- Keep messages short and actionable
- Error messages should suggest next steps

## 📖 Full Documentation

See `README.md` for complete API reference and all examples.

## 🎪 Demo

To see all variations in action:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const SnackBarExamplesPage(),
  ),
);
```

---

**Need Help?** Check the example files:

- `snackbar_examples.dart` - All snackbar types
- `social_integration_examples.dart` - Real-world use cases
- `create_post_example.dart` - Complete working example
