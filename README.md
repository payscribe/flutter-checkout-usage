# Flutter Checkout Usage

A minimal Flutter example showing how to open Payscribe Hosted Checkout with
`payscribe_checkout_flutter`.

## Run the example

After cloning the repository, generate the Flutter platform folders and install
dependencies:

```bash
flutter create .
flutter pub get
flutter run
```

Before running the checkout, replace `btn_REPLACE_WITH_A_SERVER_SESSION` in
`lib/main.dart` with a checkout session token created by your backend.

Never place a Payscribe secret key inside a Flutter application.

## Package

See [`payscribe_checkout_flutter`](https://pub.dev/packages/payscribe_checkout_flutter)
for the complete SDK documentation.
