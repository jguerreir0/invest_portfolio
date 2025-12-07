# Invest Portfolio – Flutter Challenge

A production-grade Flutter application that simulates a financial portfolio overview with:

- 🧺 Asset list (Stocks, ETFs)
- 📈 Interactive performance chart
- 🎨 Theme switch (Retail Bank ↔ Neobank)
- 🔌 gRPC communication + Protobuf models
- 🧪 Unit & Widget tests with >75% coverage
- 🧼 Clean Architecture + BLoC for state management

---

## 📦 Tech Stack

- **Flutter**
- **BLoC**
- **gRPC** + **Protobuf**
- **fl_chart** for typed, interactive charts
- **Clean Architecture** (domain → data → presentation)
- **LCOV** for test coverage reports
- **Makefile** shortcuts for developer workflow

---

## 🛠️ Requirements

- **Flutter 3.27.4**
- **Dart 3.6.2**
- **protoc**
- **make** optional but recommended
- **lcov** required for make test_coverage

---

## 🚀 Getting Started

## 1. Clone the repository

```bash
git clone https://github.com/joaoguerreiro/invest_portfolio.git
cd invest_portfolio
```

## 2. Install dependencies

You may install normally using Flutter:

```bash
flutter pub get
```

Or use the provided Makefile helper:

```bash
make get_packages
```

## 3. Generate Protobuf classes (if needed)

The repository already includes generated .pb.dart files, but if you want to regenerate:

```bash
make generate_protos
```

## 4. Start the local gRPC server

The project includes a lightweight mock gRPC server for testing the app:

```bash
make run_server
```

This launches the server and the Flutter app connects to:

```bash
localhost:50051
```

## 5. Run the app

```bash
fluter run
```

## 🧪 Running Tests

Run tests with coverage

```bash
make test_coverage
```

This will:

- run all tests
- generate coverage/lcov.cleaned.info
- generate an HTML coverage report
- open the report automatically in the browser

---

## 🧱 Architecture Overview

The solution follows clean boundaries:

**Data Layer**

- gRPC client
- Repository implementations

**Domain Layer**

- Entities
- Use cases

**Presentation Layer**

- BLoC state machine
- Pages + modular widgets
- Shared widget utilities

---

## 🏁 Running Everything Together

Quickstart (recommended):

```bash
make get_packages
make run_server
flutter run

```

---

## 🧑‍💻 Author

João Guerreiro
Senior Flutter Developer
Portugal 🇵🇹
