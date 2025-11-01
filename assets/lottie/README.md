# Lottie Animations Folder

## 📁 Place Your Lottie Files Here

This folder is for storing Lottie animation files (.json or .lottie format).

## 🎬 Recommended Files

Here are the Lottie files you should add for the snackbar system:

### Essential Animations:

- `success.json` or `checkmark.json` - Success/checkmark animation
- `error.json` - Error/warning animation
- `loading.json` - Loading spinner animation

### Optional Animations:

- `heart.json` - Like/favorite animation
- `upload.json` - Upload progress animation
- `celebration.json` - Celebration/confetti animation
- `send.json` - Send/submit animation

## 🌐 Where to Get Lottie Files

### 1. LottieFiles.com (Recommended)

- Visit: https://lottiefiles.com
- Search for animations (e.g., "success", "checkmark", "loading")
- Download as `.json` format
- Free and premium options available

### 2. Material Design Icons

- Some Material icons have Lottie versions
- Visit: https://fonts.google.com/icons

### 3. IconScout

- Visit: https://iconscout.com/lottie-animations
- Free and paid animations

## 📝 Example Files to Download

1. **Success/Checkmark**

   - Search: "checkmark animation" or "success animation"
   - Recommended style: Simple, green checkmark with smooth animation

2. **Loading**

   - Search: "loading spinner" or "loading dots"
   - Recommended style: Circular spinner or three dots

3. **Error**

   - Search: "error animation" or "warning icon"
   - Recommended style: Red X or warning symbol

4. **Heart (Like)**
   - Search: "heart animation" or "like button"
   - Recommended style: Heart that fills or pulses

## 🚀 Quick Start

1. Download Lottie files from the websites above
2. Place `.json` files in this folder
3. Update your code to reference the files:
   ```dart
   CustomSnackBar(
     message: 'Success!',
     type: SnackBarType.success,
     lottieAsset: 'assets/lottie/success.json',
     showIcon: false,
   ).show(context);
   ```

## 📏 File Guidelines

- **Format**: `.json` (preferred) or `.lottie`
- **Size**: Keep under 200 KB for best performance
- **Duration**: 1-3 seconds for snackbar animations
- **Color**: Choose animations matching your app theme

## 🎨 Example File Structure

```
assets/lottie/
├── README.md (this file)
├── success.json
├── error.json
├── loading.json
├── heart.json
├── upload.json
└── celebration.json
```

## ⚙️ After Adding Files

1. Run `flutter pub get` (if needed)
2. Hot reload your app
3. Test the animations in the app

## 🔗 Useful Links

- LottieFiles: https://lottiefiles.com
- Lottie Documentation: https://airbnb.io/lottie/
- Flutter Lottie Package: https://pub.dev/packages/lottie

---

**Note**: This folder already configured in `pubspec.yaml` and ready to use!
