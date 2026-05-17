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
| <img width="320" alt="Screenshot_1778004616" src="https://github.com/user-attachments/assets/8c1361a1-2e5d-452b-8759-3a87825f927e" /> | <img width="320" alt="Screenshot_1778004613" src="https://github.com/user-attachments/assets/9e4fcb69-dfbb-48a3-a0dc-44f43a276704" /> |
| <img width="320" alt="Screenshot_1778004616" src="https://github.com/user-attachments/assets/268c3189-f5d1-4b7e-a6c1-2e66e3cb2952" /> | <img width="320" alt="Screenshot_1778004613" src="https://github.com/user-attachments/assets/6d797264-3c7b-4849-a207-1a1b59c2a1b7" /> |
| Dashboard Light | Dashboard Dark |
| <video width="320" alt="Screenshot_1778004616" src="https://github.com/user-attachments/assets/1f6c9102-22f7-4585-a052-6f0f94249331" /> | <video width="320" alt="Screenshot_1778004613" src="https://github.com/user-attachments/assets/445b7313-e289-46a8-a1b7-8fa8aa57e925" /> |
