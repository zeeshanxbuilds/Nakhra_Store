# NAKHRA 🛍️

**Nakhra** is a modern Flutter-based e‑commerce application built with **clean architecture**, **feature‑first folder structure**, and **light/dark theme support**. The project focuses on scalability, maintainability, and industry‑standard practices used in professional Flutter teams.

---

## 📌 Project Goals

* Build a production‑ready Flutter e‑commerce app
* Follow clean architecture principles
* Support light & dark themes
* Maintain consistent typography and design system
* Prepare a codebase suitable for team collaboration and future scaling

---

## 🏗️ Architecture Overview

The project follows **Feature‑First + Clean Architecture**:

```
lib/
 ├── app/            # App-level configuration (MaterialApp, routes)
 ├── core/           # Shared utilities, constants, services
 ├── features/       # Business features (auth, products, cart, etc.)
 │   └── feature_name/
 │       ├── data/        # APIs, models, repository implementations
 │       ├── domain/      # Entities, repositories, use-cases
 │       └── presentation/# UI, state management
 ├── theme/          # Light & Dark themes, typography
 └── main.dart       # App entry point
```

### Why this architecture?

* Clear separation of concerns
* Easy testing and refactoring
* Industry‑proven for medium to large Flutter apps

---

## 🎨 Theming (Light & Dark Mode)

Nakhra supports **system‑based theming** with manual override capability.

* Uses `ThemeData` and `ColorScheme`
* No hard‑coded colors in widgets
* Typography centralized using `TextTheme`

```
MaterialApp(
  theme: lightTheme,
  darkTheme: darkTheme,
  themeMode: ThemeMode.system,
)
```

This ensures:

* Accessibility compliance
* Consistent UI across screens
* Easy brand customization

---

## 🔤 Typography & Fonts

* Custom font family: **Poppins**
* Multiple weights (Light, Regular, Medium, Bold)
* Fonts declared in `pubspec.yaml`
* Font usage handled via `TextTheme`

Example:

```
Text(
  'Product Name',
  style: Theme.of(context).textTheme.titleLarge,
)
```

---

## 📦 State Management

(State management choice can evolve as the app grows)

Planned / Supported options:

* Riverpod (recommended)
* Bloc / Cubit (enterprise ready)

State lives only in the **presentation layer**.

---

## 🧪 Testing Strategy

```
test/
 ├── unit/
 ├── widget/
 └── integration/
```

* Domain layer is fully testable
* UI logic separated from business logic
* Prepared for CI/CD pipelines

---

## 🚀 Getting Started

### Prerequisites

* Flutter SDK (stable channel)
* Dart SDK
* Android Studio or VS Code

### Run the project

```
flutter pub get
flutter run
```

---

## 📱 Supported Platforms

* ✅ Android
* ✅ iOS
<!-- * ⏳ Web (planned) -->

---

## 🧠 Learning Purpose

This project is also designed as a **learning reference** for:

* Flutter folder structure
* Clean architecture concepts
* Theming & typography
* Professional Flutter workflows

---

## 📈 Future Improvements

* Authentication (Firebase / API)
* Product listing & filters
* Cart & checkout flow
* Payment gateway integration
* Localization (i18n)

---

## 🤝 Contribution Guidelines

* Follow existing architecture
* Avoid hard‑coded colors & styles
* Write clean, readable code
* Keep widgets small and reusable

---

## 📄 License

This project is for **educational and learning purposes**.

---

## ✨ Muhammad Zeeshan

**Nakhra Flutter App**
Built with a focus on clean code, discipline, and industry standards.

---

> "Good UI is designed. Great UI is engineered."
