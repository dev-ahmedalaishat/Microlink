# 🎨 Custom SnackBar Visual Guide

## Available Types

### 1. ✅ Success (Green)

**Use for:** Completed actions, successful submissions

```dart
context.showSuccessSnackBar('Post submitted successfully!');
```

**Color:** Green (#4CAF50)
**Icon:** ✓ Check circle
**Duration:** 3 seconds

---

### 2. ❌ Error (Red)

**Use for:** Failed operations, errors

```dart
context.showErrorSnackBar('Failed to submit post');
```

**Color:** Red (#F44336)
**Icon:** ⚠ Error circle
**Duration:** 4 seconds (longer for errors)

---

### 3. ⚠️ Warning (Orange)

**Use for:** Warnings, cautions, confirmations needed

```dart
context.showWarningSnackBar('This action cannot be undone');
```

**Color:** Orange (#FF9800)
**Icon:** ⚠ Warning triangle
**Duration:** 3 seconds

---

### 4. ℹ️ Info (Blue)

**Use for:** General information, tips, updates

```dart
context.showInfoSnackBar('New features available');
```

**Color:** Blue (#2196F3)
**Icon:** ℹ Info circle
**Duration:** 3 seconds

---

### 5. ⏳ Loading (Gray)

**Use for:** Ongoing operations, progress indication

```dart
context.showLoadingSnackBar('Posting...');
// ... do work ...
context.hideSnackBar();
```

**Color:** Gray (#757575)
**Icon:** Hourglass (with spinner)
**Duration:** Persistent (until hidden)

---

## Special Variations

### With Action Button

Perfect for: Post submissions that need approval

```dart
CustomSnackBar(
  message: 'Post submitted – pending approval',
  type: SnackBarType.success,
  onTap: () {
    // Action on "VIEW" button tap
  },
).show(context);
```

**Shows:** Green snackbar with "VIEW" button on right

---

### With Close Button

Perfect for: Long messages, non-urgent info

```dart
CustomSnackBar(
  message: 'Processing your request...',
  type: SnackBarType.info,
  showCloseButton: true,
  duration: const Duration(seconds: 10),
).show(context);
```

**Shows:** X button on right side

---

### With Custom Icon

Perfect for: Special actions (like, save, share)

```dart
CustomSnackBar(
  message: 'Post liked!',
  type: SnackBarType.success,
  customIcon: Icons.favorite,
).show(context);
```

**Shows:** Heart icon instead of default checkmark

---

### Without Icon

Perfect for: Simple text messages

```dart
CustomSnackBar(
  message: 'No internet connection',
  type: SnackBarType.error,
  showIcon: false,
).show(context);
```

**Shows:** Just text, no icon

---

### With Custom Trailing Widget

Perfect for: Image uploads, thumbnails, counts

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

**Shows:** Custom widget on right side

---

## Common Use Cases

| Action                     | SnackBar Type    | Example Message                         |
| -------------------------- | ---------------- | --------------------------------------- |
| Post submitted (pending)   | Success + Action | "Post submitted – pending approval"     |
| Post submitted (immediate) | Success          | "Post published successfully!"          |
| Post failed                | Error + Retry    | "Failed to submit. Please try again."   |
| No internet                | Error + Retry    | "No internet connection"                |
| Like post                  | Success (short)  | "Post liked!"                           |
| Delete post                | Success          | "Post deleted successfully"             |
| Comment posted             | Success          | "Comment posted!"                       |
| Image uploading            | Loading          | "Uploading image..."                    |
| Form validation            | Warning          | "Please fill all required fields"       |
| Feature update             | Info             | "New features available in this update" |

---

## Timing Guidelines

| Type    | Default Duration | Recommended            |
| ------- | ---------------- | ---------------------- |
| Success | 3 seconds        | 2-3 seconds            |
| Error   | 4 seconds        | 4-5 seconds            |
| Warning | 3 seconds        | 3-4 seconds            |
| Info    | 3 seconds        | 3-4 seconds            |
| Loading | Persistent       | Until action completes |

**Pro Tip:** Give users more time to read error messages, less time for simple confirmations.

---

## Accessibility

All snackbars include:

- ✅ Clear visual indicators (colors)
- ✅ Icons for quick recognition
- ✅ White text on colored background (high contrast)
- ✅ Appropriate sizing for touch targets
- ✅ Semantic meaning through color choice

---

## Best Practices

### ✅ DO:

- Show snackbars for important user feedback
- Use appropriate types for different scenarios
- Provide action buttons for next steps
- Keep messages short and clear
- Hide loading snackbars when done

### ❌ DON'T:

- Show too many snackbars in quick succession
- Use snackbars for critical warnings (use dialogs instead)
- Forget to hide loading snackbars
- Make messages too long
- Use generic messages like "Error" without context

---

## Your Screenshots Implementation

Based on your screenshots:

### Screenshot 1: Loading State

```dart
context.showLoadingSnackBar('Posting...');
```

### Screenshot 2: Success with Approval

```dart
CustomSnackBar(
  message: 'Post submitted – pending approval',
  type: SnackBarType.success,
  onTap: () {
    // Navigate to my posts or pending approval view
  },
).show(context);
```

This matches the green checkmark snackbar with the arrow/action button on the right! ✨
