# Instagramify Just another trash learning project

A new Flutter project.

## Overview
Flutter firebase okr is a learning project for connecting the firebase services with flutter and creating a real-time user experience service.
- As a part of my learning this project will have components
- User sign-in and register (Firebase Auth, Firestore).
- User dashboard sample - Instagram Home page, Community posts, Profile
- Memory management techniques
- Goal - Make efficient, optimized, reusable.

Progress made so-far
- Added flutter_gen for building images, colors at one go - `flutter pub run build_runner build --delete-conflicting-outputs`
- Added user authentication login and register screens
- Implemented snackbar messages for success and error scenarios
- Implemented Dashboard and fetch latest posts feature from firebase using `streams`.
- Added card design for posts
- Implemented Glass-UI like design

**Firebase setup**
- Download firebase in windows or mac - [Firebase | Android | Setup](https://firebase.google.com/docs/flutter/setup?platform=android)
- Then create a sample firebase project
- Go to settings add devices - Android, Ios, Web - create the app and download and store the google-services.json file in root
- add flutter package `flutter_firebase` and login
- For firebase auth - add email/password sign-in option
- For firestore - create a test collection and add a document-id

| Light | Dark |
| ----- | ----- |
| <img width="320" alt="Screenshot_1778004616" src="https://github.com/user-attachments/assets/69d51332-1459-419e-92d8-f6f86779272a" /> | <img width="320" alt="Screenshot_1778004613" src="https://github.com/user-attachments/assets/f3c91a2f-8a88-4c35-9b47-4bf2d1437b42" /> |
| <img width="320" alt="Screenshot_1778004616" src="https://github.com/user-attachments/assets/8bcfc655-f273-45ab-b4ed-f1ed5b579538" /> | <img width="320" alt="Screenshot_1778004613" src="https://github.com/user-attachments/assets/d20f7196-87a2-41e4-94f5-d9529e0e93e2" /> |
| Login Process |
| <video width="320" alt="Screenshot_1778004616" src="https://github.com/user-attachments/assets/f83477cd-4604-4834-b892-425df8cf8517" /> | <video width="320" alt="Screenshot_1778004613" src="https://github.com/user-attachments/assets/c7cdecba-a02a-4f3e-b977-3c39aeda92a3" /> |
| Dashboard Light | Dashboard Dark |
| <video width="320" alt="Screenshot_1778004616" src="https://github.com/user-attachments/assets/1f6c9102-22f7-4585-a052-6f0f94249331" /> | <video width="320" alt="Screenshot_1778004613" src="https://github.com/user-attachments/assets/445b7313-e289-46a8-a1b7-8fa8aa57e925" /> |
