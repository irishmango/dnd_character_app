# 🧙‍♂️ D&D Character App

A Flutter app for creating, viewing, and managing custom Dungeons & Dragons characters. Built with clean architecture, Firestore integration, and expressive UI components.

## ✨ Features

- Create custom characters with stats, vocation, slogan, and abilities
- View detailed profiles with stats table, skills, and equipment
- Mark favorite characters with an animated heart
- Dynamically increase/decrease character stats
- Save updates to Firestore
- Swipe to delete characters
- Fetch characters once and avoid duplicates in memory

## Tech Stack

- **Flutter** + **Dart**
- **Cloud Firestore** for backend
- **Provider** for state management
- **Hero animations**, custom icons, styled buttons & text
- Responsive design and theme customization

## Packages Used

- [`cloud_firestore`](https://pub.dev/packages/cloud_firestore)
- [`provider`](https://pub.dev/packages/provider)
- [`uuid`](https://pub.dev/packages/uuid)
- [`google_fonts`](https://pub.dev/packages/google_fonts)

## Project Structure

- `models/` – Dart classes for character, vocation, and skills
- `services/` – Firestore integration and character state manager
- `screens/` – UI screens (home, profile, create)
- `shared/` – Reusable widgets and styles
- `theme.dart` – Centralized theme and color settings

## Screenshots

*(Add screenshots here using the instructions below)*