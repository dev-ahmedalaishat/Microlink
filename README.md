# Micropolis Socials – Mobile App Assessment

## Overview

This repository contains the Flutter implementation of the "Socials" community feature for the Micropolis Mobile Developer assessment.  
The app provides a two-tab social feed interface that allows users to create posts, track approval status, and interact with approved posts via likes and comments.

Backend API and request details are provided via the accompanying Postman collection. Base URL: `https://api-test.micropolis.tech`.

---

## Features

### 1. Post Submission and Status Management

- Users can create text posts with up to **2 images**.
- Posts display an immediate **“Pending Approval”** status upon submission.
- Posts appear in **My Posts** tab as pending or approved based on API response.

### 2. Feed Display and Interaction

- Two-tab interface:
  - **Latest Feed:** Displays approved posts from all users.
  - **My Posts:** Displays both approved and pending posts for the current user.
- Each post shows **user info**, **content**, and **interaction counts (likes/comments)**.
- Tapping an approved post opens a **dedicated comments view**.
- Users can **Like** and **Comment** on approved posts.

### 3. UI/UX and Design

- Fully responsive for **phones and tablets**.
- Clear visual hierarchy with polished typography and spacing.
- Subtle, quiet animations to enhance transitions while keeping UI clean.
- **Shimmer loading effects** for feed placeholders.
- **Loading indicators**, **empty states**, and **error messages** for smooth user experience.

### 4. Extra Features & Enhancements

- **Supports Light and Dark themes.**
- **Comment In-Progress Animation:** Smooth feedback when posting a comment.
- **Optimistic Like Handling:** Likes update instantly in the UI, then sync with API response.
- **Lottie Animations:** Used for loaders to create a polished and modern experience.

---

## Technical Notes

- Built with **Flutter**, using **Clean Architecture** and **Bloc/Cubit** for predictable state management.
- Optimistic UI updates for posts and comments.
- Integrated with the backend at `https://api-test.micropolis.tech`.
- Tags:
  - `v1.0.0` – Initial submission
  - `v1.1.0` – Enhanced version with extra features and UI refinements.

---

## Notes & Limitations

- **Missing `isLiked` property:** The API does not provide a flag for whether the current user liked a post. `isLiked` defaults to `false` in the app.
- **Media uploads not supported:** The API accepts only media URLs; direct media upload in the request body is not supported.
- **User avatars missing:** API does not provide user images; static placeholder images are used.

---

## Running the App

1. Clone the repository:

```bash
git clone https://github.com/dev-ahmedalaishat/Microlink.git
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

## APK Download

You can download the compiled APK to test the app on a device:

- **Version 1.1.0 (Enhanced):** [Download APK](https://drive.google.com/file/d/1epFpXheodtDgeCJT0ifLtPbVfNvBumYT/view?usp=sharing)

> Note: Install on Android devices. For iOS testing, please run from Xcode/Flutter.
