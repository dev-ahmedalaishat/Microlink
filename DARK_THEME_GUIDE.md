# Dark Theme Support

This project now supports both light and dark themes with automatic persistence of user preferences.

## Features

- ✅ Complete light and dark theme definitions
- ✅ Automatic theme persistence using SharedPreferences
- ✅ System theme mode support
- ✅ Easy theme switching with `ThemeCubit`
- ✅ Pre-built `ThemeToggleButton` widget

## Usage

### Adding Theme Toggle Button

You can add the theme toggle button to any screen, typically in an AppBar:

```dart
import 'package:microlink/core/presentation/widgets/theme_toggle_button.dart';

AppBar(
  title: Text('My App'),
  actions: [
    ThemeToggleButton(), // Add this to toggle theme
  ],
)
```

### Programmatic Theme Control

Access the `ThemeCubit` to control theme programmatically:

```dart
// Toggle between light and dark
context.read<ThemeCubit>().toggleTheme();

// Set specific theme mode
context.read<ThemeCubit>().setThemeMode(ThemeMode.dark);
context.read<ThemeCubit>().setThemeMode(ThemeMode.light);
context.read<ThemeCubit>().setThemeMode(ThemeMode.system);

// Listen to theme changes
BlocBuilder<ThemeCubit, ThemeMode>(
  builder: (context, themeMode) {
    return Text('Current theme: $themeMode');
  },
)
```

## Architecture

### Files Added/Modified

1. **`lib/core/theme/color_palette.dart`**

   - Added `AppColorsDark` class with dark theme colors

2. **`lib/core/theme/app_theme.dart`**

   - Added `AppTheme.darkTheme` with complete dark theme configuration

3. **`lib/core/theme/theme_cubit.dart`** (NEW)

   - State management for theme switching
   - Automatic persistence to SharedPreferences

4. **`lib/core/presentation/widgets/theme_toggle_button.dart`** (NEW)

   - Ready-to-use theme toggle button widget

5. **`lib/injection_container.dart`**

   - Registered `SharedPreferences` and `ThemeCubit`

6. **`lib/main.dart`**
   - Integrated theme cubit with MaterialApp
   - Added `darkTheme` and `themeMode` properties

## Theme Colors

### Light Theme

- Primary: Teal (#006C5D)
- Background: Light gray (#F5F5F5)
- Surface: White (#FFFFFF)
- Text: Dark gray (#212121)

### Dark Theme

- Primary: Lighter teal (#26A69A)
- Background: Very dark gray (#121212)
- Surface: Dark gray (#1E1E1E)
- Text: Light gray (#E0E0E0)

## Customization

To modify theme colors, edit:

- Light theme colors: `lib/core/theme/color_palette.dart` → `AppColors`
- Dark theme colors: `lib/core/theme/color_palette.dart` → `AppColorsDark`

To modify theme properties, edit:

- Light theme: `lib/core/theme/app_theme.dart` → `AppTheme.lightTheme`
- Dark theme: `lib/core/theme/app_theme.dart` → `AppTheme.darkTheme`
