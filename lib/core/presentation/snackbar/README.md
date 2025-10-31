# Custom SnackBar System

A fully customizable snackbar system for Flutter with support for different types, loading states, and custom actions.

## Features

- ✅ Multiple snackbar types (Success, Error, Warning, Info, Loading)
- ✅ Customizable icons and colors
- ✅ Loading state with spinner
- ✅ Action buttons (like "View")
- ✅ Close button option
- ✅ Custom trailing widgets
- ✅ Automatic dismissal with configurable duration
- ✅ Easy-to-use extension methods on BuildContext

## Usage

### Basic Usage

#### 1. Success SnackBar

```dart
context.showSuccessSnackBar('Post submitted successfully!');
```

#### 2. Error SnackBar

```dart
context.showErrorSnackBar('Failed to submit post. Please try again.');
```

#### 3. Warning SnackBar

```dart
context.showWarningSnackBar('This action cannot be undone.');
```

#### 4. Info SnackBar

```dart
context.showInfoSnackBar('New features available in this update.');
```

#### 5. Loading SnackBar

```dart
// Show loading
context.showLoadingSnackBar('Posting...');

// Hide when done
context.hideSnackBar();
```

### Advanced Usage

#### With Action Button

```dart
CustomSnackBar(
  message: 'Post submitted – pending approval',
  type: SnackBarType.success,
  onTap: () {
    // Navigate to pending posts
    Navigator.pushNamed(context, '/pending-posts');
  },
).show(context);
```

#### With Close Button

```dart
CustomSnackBar(
  message: 'Processing your request...',
  type: SnackBarType.info,
  showCloseButton: true,
  duration: const Duration(seconds: 10),
).show(context);
```

#### With Custom Icon

```dart
CustomSnackBar(
  message: 'Post liked!',
  type: SnackBarType.success,
  customIcon: Icons.favorite,
).show(context);
```

#### Without Icon

```dart
CustomSnackBar(
  message: 'No internet connection',
  type: SnackBarType.error,
  showIcon: false,
).show(context);
```

#### With Custom Trailing Widget

```dart
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
    child: const Icon(Icons.image, color: Colors.white),
  ),
).show(context);
```

### Real-world Examples

#### Post Submission Flow

```dart
void submitPost(BuildContext context) async {
  // Show loading
  context.showLoadingSnackBar('Posting...');

  try {
    // Call API
    await apiService.submitPost(postData);

    // Hide loading
    context.hideSnackBar();

    // Show success with action
    CustomSnackBar(
      message: 'Post submitted – pending approval',
      type: SnackBarType.success,
      onTap: () {
        Navigator.pushNamed(context, '/pending-posts');
      },
    ).show(context);
  } catch (e) {
    // Hide loading
    context.hideSnackBar();

    // Show error with retry
    CustomSnackBar(
      message: 'Failed to submit. Please try again.',
      type: SnackBarType.error,
      onTap: () => submitPost(context),
    ).show(context);
  }
}
```

#### Network Error with Retry

```dart
CustomSnackBar(
  message: 'Network error occurred',
  type: SnackBarType.error,
  duration: const Duration(seconds: 5),
  onTap: () {
    // Retry the operation
    retryOperation();
  },
).show(context);
```

#### Like Action Feedback

```dart
void toggleLike(BuildContext context) {
  // Update UI immediately
  setState(() => isLiked = !isLiked);

  // Show feedback
  if (isLiked) {
    context.showSuccessSnackBar(
      'Post liked!',
      duration: const Duration(seconds: 2),
    );
  }
}
```

## Customization

### Colors

The snackbar colors are automatically determined based on the type:

- **Success**: Green (`AppColors.success`)
- **Error**: Red (`AppColors.error`)
- **Warning**: Orange (`AppColors.warning`)
- **Info**: Blue (`AppColors.info`)
- **Loading**: Gray (`AppColors.textSecondary`)

To change these colors, modify the values in `lib/core/theme/color_palette.dart`.

### Duration

Default durations:

- Success: 3 seconds
- Error: 4 seconds
- Warning: 3 seconds
- Info: 3 seconds
- Loading: Persistent (until manually dismissed)

You can override the duration:

```dart
context.showSuccessSnackBar(
  'Message',
  duration: const Duration(seconds: 5),
);
```

### Styling

To customize the appearance, modify the snackbar configuration in `custom_snackbar.dart`:

```dart
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(12), // Change border radius
),
margin: const EdgeInsets.all(16), // Change margin
padding: const EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 12,
), // Change padding
```

## API Reference

### CustomSnackBar Class

#### Constructor Parameters

| Parameter         | Type            | Default     | Description                   |
| ----------------- | --------------- | ----------- | ----------------------------- |
| `message`         | `String`        | required    | The message to display        |
| `type`            | `SnackBarType`  | `info`      | The type of snackbar          |
| `duration`        | `Duration`      | `3 seconds` | How long to show the snackbar |
| `showIcon`        | `bool`          | `true`      | Whether to show the icon      |
| `customIcon`      | `IconData?`     | `null`      | Custom icon to use            |
| `onTap`           | `VoidCallback?` | `null`      | Action button callback        |
| `trailing`        | `Widget?`       | `null`      | Custom trailing widget        |
| `showCloseButton` | `bool`          | `false`     | Show close button             |

### Extension Methods on BuildContext

| Method                         | Description               |
| ------------------------------ | ------------------------- |
| `showSuccessSnackBar(message)` | Show a success snackbar   |
| `showErrorSnackBar(message)`   | Show an error snackbar    |
| `showWarningSnackBar(message)` | Show a warning snackbar   |
| `showInfoSnackBar(message)`    | Show an info snackbar     |
| `showLoadingSnackBar(message)` | Show a loading snackbar   |
| `hideSnackBar()`               | Hide the current snackbar |

## Best Practices

1. **Loading States**: Always use `showLoadingSnackBar()` for async operations and remember to call `hideSnackBar()` when done.

2. **Error Handling**: Provide clear, actionable error messages and consider adding a retry action.

3. **Duration**: Keep success messages short (2-3 seconds), give more time for errors (4-5 seconds).

4. **Don't Overuse**: Only show snackbars for important feedback. Don't spam users with too many notifications.

5. **Accessibility**: The snackbar automatically uses appropriate colors and icons for different types to help with accessibility.

## Migration from Default SnackBar

Replace this:

```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('Success!')),
);
```

With this:

```dart
context.showSuccessSnackBar('Success!');
```

## Examples

Run the example page to see all variations:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SnackBarExamplesPage()),
);
```
