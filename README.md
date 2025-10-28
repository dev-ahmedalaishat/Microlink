# MicroLink - Social Media Feature

A Flutter social media application implementing community posting and feed functionality with Clean Architecture principles.

## 📋 Project Overview

The **Socials** feature is a community-focused social media implementation that allows users to:
- Create posts with text and optional images (max 2)
- View feeds of approved community posts
- Track their own post approval status
- Interact with posts via likes and comments
- Navigate between Latest Feed and My Posts tabs

## 🏗️ Architecture Decisions

### Core Architecture
- **Clean Architecture** (simplified - without use cases for initial implementation)
- **Cubit** for state management (part of flutter_bloc)
- **Dio** for HTTP client and API communication
- **Freezed** for immutable data classes and JSON serialization
- **Get_it** for dependency injection
- **Responsive Design** for mobile and tablet support

### Project Structure
```
lib/
├── core/                           # Shared utilities and configurations
│   ├── error/                      # Error handling & custom exceptions
│   ├── theme/                      # App theming system
│   │   ├── app_theme.dart          # Main theme configuration
│   │   ├── color_palette.dart      # Color definitions
│   │   ├── text_styles.dart        # Typography system
│   │   └── spacing.dart            # Consistent spacing values
│   ├── network/                    # Network utilities
│   │   └── network_info.dart       # Network connectivity checker
│   ├── constants/                  # App-wide constants
│   └── responsive/                 # Responsive design utilities
│       ├── responsive_builder.dart # Screen size detection
│       ├── screen_breakpoints.dart # Device breakpoints
│       └── adaptive_scaffold.dart  # Adaptive navigation
├── features/
│   └── social/                     # Social media feature
│       ├── data/                   # Data layer
│       │   ├── datasources/        # Remote & local data sources
│       │   │   ├── social_remote_datasource.dart
│       │   │   └── social_local_datasource.dart
│       │   ├── models/             # Data models (JSON serializable)
│       │   │   ├── post_model.dart
│       │   │   ├── comment_model.dart
│       │   │   └── user_model.dart
│       │   └── repositories/       # Repository implementations
│       │       └── social_repository_impl.dart
│       ├── domain/                 # Domain layer (business logic)
│       │   ├── entities/           # Business models
│       │   │   ├── post.dart
│       │   │   ├── comment.dart
│       │   │   └── user.dart
│       │   └── repositories/       # Repository interfaces
│       │       └── social_repository.dart
│       └── presentation/           # Presentation layer
│           ├── cubit/              # State management
│           │   ├── posts/
│           │   │   ├── posts_cubit.dart
│           │   │   └── posts_state.dart
│           │   ├── comments/
│           │   │   ├── comments_cubit.dart
│           │   │   └── comments_state.dart
│           │   └── post_creation/
│           │       ├── post_creation_cubit.dart
│           │       └── post_creation_state.dart
│           ├── pages/              # Screen widgets
│           │   ├── social_main_page.dart
│           │   ├── latest_feed_page.dart
│           │   ├── my_posts_page.dart
│           │   ├── post_creation_page.dart
│           │   └── post_detail_page.dart
│           └── widgets/            # Reusable components
│               ├── post_card.dart
│               ├── comment_tile.dart
│               ├── image_picker_widget.dart
│               └── loading_widgets.dart
└── injection_container.dart        # Dependency injection setup
```

## 🔧 Technical Stack

### Dependencies
```yaml
dependencies:
  # Core Framework
  flutter:
    sdk: flutter

  # Architecture & State Management
  flutter_bloc: ^8.1.3          # Cubit/Bloc state management
  get_it: ^7.6.4                # Service locator for DI
  
  # Code Generation & Data Classes
  freezed_annotation: ^2.4.1    # Immutable classes annotations
  json_annotation: ^4.8.1       # JSON serialization annotations
  
  # Network & API
  dio: ^5.4.0                   # HTTP client
  internet_connection_checker: ^1.0.0+1  # Network connectivity
  
  # UI & Media
  image_picker: ^1.0.4          # Camera/gallery access
  cached_network_image: ^3.3.0  # Image caching and display
  flutter_spinkit: ^5.2.0       # Loading animations
  
  # Storage
  shared_preferences: ^2.2.2    # Local data persistence

dev_dependencies:
  # Code Generation
  freezed: ^2.4.7               # Code generation for data classes
  json_serializable: ^6.7.1     # JSON serialization code generation
  build_runner: ^2.4.7          # Code generation runner
  
  # Testing
  flutter_test:
    sdk: flutter
  bloc_test: ^9.1.4             # Cubit/Bloc testing utilities
```

### API Integration

**Base URL:** `https://api-test.micropolis.tech`

#### Endpoints:
- `POST /posts` - Create new post
- `GET /posts/my?user_id={id}&page={n}&limit={n}` - Get user's posts
- `GET /posts/latest?page={n}&limit={n}` - Get approved posts
- `POST /posts/{post_id}/comments` - Add comment
- `GET /posts/{post_id}/comments` - Get comments
- `POST /posts/{post_id}/like` - Toggle like
- `GET /health` - Health check

#### User Management Strategy:
- Fetch user ID from initial `GET /posts/latest` API call
- Store user ID locally using SharedPreferences
- Use stored user ID for all subsequent API operations

## 🎨 UI/UX Requirements

### Design Principles
- **Production-ready polish** with attention to visual hierarchy
- **Responsive design** supporting mobile phones and tablets
- **Smooth animations** for enhanced user experience
- **Consistent theming** across all screens
- **Accessibility support** with proper semantic labels

### Layout Adaptations
- **Phone (< 600px):** Single column layout, bottom navigation
- **Tablet (600-900px):** Single column with larger margins
- **Large Tablet (> 900px):** Multi-column layout where appropriate

### Key UI Components
- **Two-tab interface:** Latest Feed & My Posts
- **Floating Action Button** with navigation options (Map, Socials, My Unit)
- **Post cards** with user info, content, and interaction counters
- **Status indicators** for pending vs approved posts
- **Image picker** supporting up to 2 images per post
- **Comments view** with real-time updates

## 🔄 State Management Strategy

### Cubit States (using Freezed)
```dart
@freezed
class PostsState with _$PostsState {
  const factory PostsState.initial() = _Initial;
  const factory PostsState.loading() = _Loading;
  const factory PostsState.success(List<Post> posts) = _Success;
  const factory PostsState.error(String message) = _Error;
}
```

### Data Flow
1. **UI Layer** triggers actions via Cubit methods
2. **Cubit** calls Repository methods directly (no use cases initially)
3. **Repository** coordinates between Remote and Local data sources
4. **Data Sources** handle API calls and local storage
5. **Models** serialize/deserialize data using Freezed + json_annotation
6. **States** update UI through BlocBuilder/BlocConsumer widgets

## 📱 Core Features

### Post Management
- **Create Posts:** Text content with optional images (max 2)
- **Status Tracking:** Pending/Under Approval vs Approved states
- **My Posts Feed:** Display all user posts regardless of status
- **Latest Feed:** Display only approved community posts

### Interactions
- **Like/Unlike:** Toggle post likes with optimistic updates
- **Comments:** Add and view comments on approved posts
- **Post Details:** Dedicated view for post comments and interactions

### User Experience
- **Optimistic UI:** Instant feedback for user actions
- **Loading States:** Skeleton screens and spinners during network requests
- **Error Handling:** User-friendly error messages with retry options
- **Empty States:** Informative displays when feeds are empty

## 🚀 Implementation Phases

### Phase 1: Foundation Setup
- [ ] Set up Clean Architecture project structure with core dependencies
- [ ] Create basic theme system and responsive framework
- [ ] Implement dependency injection container

### Phase 2: Data Layer
- [ ] Implement data models and API services with Dio
- [ ] Set up repository pattern with data sources
- [ ] Create domain entities with Freezed annotations

### Phase 3: State Management
- [ ] Build Cubit state management layer
- [ ] Implement states using Freezed unions
- [ ] Set up proper error handling and loading states

### Phase 4: Core UI Implementation
- [ ] Create two-tab navigation (Latest Feed / My Posts)
- [ ] Implement Latest Feed screen with post display
- [ ] Implement My Posts screen with status indicators
- [ ] Build post creation screen with image picker

### Phase 5: Advanced Features
- [ ] Add comments functionality and detail view
- [ ] Implement like/unlike functionality with optimistic updates
- [ ] Add responsive design adaptations

### Phase 6: Polish & Testing
- [ ] Add loading animations and error handling
- [ ] Implement skeleton screens and empty states
- [ ] Final testing across different screen sizes and scenarios

## 🔍 Development Guidelines

### Code Quality
- Use **Freezed** for all data classes and states
- Implement **proper error handling** at all layers
- Follow **Clean Architecture** separation of concerns
- Write **comprehensive tests** for business logic
- Use **consistent naming conventions** across the codebase
- **Separate widgets** into reusable components with clear responsibilities

## 🧩 Widget Architecture (Clean Code Implementation)

### Separated Widget Components
The social feed implementation follows a **clean, modular approach** with separated widgets:

#### PostCard Widget
```dart
class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onMoreTap;
  
  // Clean separation: only accepts post data and callbacks
}
```

#### MyPostCard Widget  
```dart
class MyPostCard extends StatelessWidget {
  final Post post;
  final VoidCallback? onTap;
  
  // Specialized for user's own posts with status indicators
}
```

### Benefits of Separated Widgets
- **Single Responsibility:** Each widget has one clear purpose
- **Reusability:** Components can be used across different screens
- **Maintainability:** Easy to modify individual components
- **Testing:** Widgets can be tested independently
- **Clean Code:** Main page focuses on layout, not implementation details

### Implementation Guidelines
1. **Pass only necessary data** - avoid passing entire contexts or complex objects
2. **Use callbacks for interactions** - parent handles business logic
3. **Keep widgets focused** - one widget, one responsibility
4. **Consistent naming** - clear, descriptive widget names
5. **Document parameters** - clear documentation for each widget's purpose
6. **Always use widget extensions** - leverage the comprehensive extension system

## 🔧 Widget Extensions System

### Core Extensions Used
The app utilizes a comprehensive widget extensions system (`lib/core/extensions/widget_extensions.dart`) for consistent styling:

#### Spacing Extensions
```dart
// Instead of: const SizedBox(height: 12)
Text('Content').spaceM()  // Adds 12px spacing below

// Instead of: Padding(padding: EdgeInsets.all(16), child: widget)
widget.paddingL()  // Adds 16px padding all around
```

#### Card Extensions
```dart
// Instead of: Card(elevation: 4, shape: RoundedRectangleBorder(...))
content.cardM(radius: 12.0)  // Medium elevation with custom radius
```

#### Margin Extensions
```dart
// Instead of: Container(margin: EdgeInsets.only(bottom: 12), child: widget)
widget.marginOnly(bottom: 12.0)  // Clean margin application
```

#### Gesture Extensions
```dart
// Instead of: GestureDetector(onTap: callback, child: widget)
widget.onTap(callback)  // Simple tap gesture
```

### Extension Categories Available
- **Padding:** `paddingXS()`, `paddingS()`, `paddingM()`, `paddingL()`, `paddingXL()`
- **Spacing:** `spaceXS()`, `spaceS()`, `spaceM()`, `spaceL()`, `spaceXL()`
- **Cards:** `cardFlat()`, `cardS()`, `cardM()`, `cardL()`, `cardXL()`
- **Sizing:** `avatarSize()`, `buttonHeight()`, `iconL()`, `fullWidth()`
- **Styling:** `borderRadius()`, `opacity()`, `background()`
- **Layout:** `center()`, `expanded()`, `flexible()`
- **Gestures:** `onTap()`, `onLongPress()`

### Real Implementation Example
```dart
// Before (verbose, manual styling):
Card(
  margin: EdgeInsets.only(bottom: 12),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        header,
        SizedBox(height: 12),
        content,
        SizedBox(height: 8),
        actions,
      ],
    ),
  ),
)

// After (clean, extension-based):
Column(
  children: [
    header,
    content.spaceM(),
    actions.spaceS(),
  ],
).paddingL().cardM(radius: 12.0).marginOnly(bottom: 12.0)
```

### Benefits of Extension System
- **Consistency:** Predefined spacing values from `AppConstants`
- **Readability:** Fluent, chainable API
- **Maintainability:** Single source of truth for styling
- **Performance:** No extra widget wrapping overhead
- **Developer Experience:** IntelliSense support and easy discovery

### Performance Considerations
- Implement **image caching** for network images
- Use **pagination** for feed loading
- Optimize **list rendering** for large feeds
- Implement **proper memory management** for images

### Responsive Design
- Test on **multiple screen sizes** (phone, tablet, large screens)
- Ensure **touch targets** are adequately sized (minimum 44px)
- Implement **adaptive navigation** patterns
- Avoid **horizontal scrolling** on all screen sizes

## 📚 Architecture Benefits

### Maintainability
- **Clear separation** of concerns across layers
- **Easy to modify** without affecting other parts
- **Consistent patterns** throughout the codebase
- **Future-proof** for adding new features

### Testability
- **Independent layers** can be tested separately
- **Repository pattern** allows easy mocking
- **Cubit testing** with bloc_test package
- **Dependency injection** enables test doubles

### Scalability
- **Modular structure** supports feature additions
- **Clean interfaces** allow implementation swapping
- **State management** handles complex interactions
- **Responsive design** adapts to different devices

---

## 🏁 Getting Started

1. **Clone** the repository
2. **Install dependencies:** `flutter pub get`
3. **Generate code:** `flutter packages pub run build_runner build`
4. **Run the app:** `flutter run`

## 📝 Notes

- This README serves as the **single source of truth** for architectural decisions
- Update this document when making **significant architectural changes**
- Refer to this document during **code reviews** and **implementation**
- Use the **Phase-based approach** for systematic development

---

*This document will be updated as the project evolves and new requirements emerge.*
