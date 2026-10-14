# Project rules

Relevo sandbox: a minimal Flutter app used to test the Relevo workflow end to end.

- Flutter, Dart null safety. Target: Android.
- Keep widgets small and in `lib/`. One screen per file under `lib/screens/`.
- Every user-visible behaviour has a widget test under `test/`.
- Run `flutter analyze` and `flutter test`; both must pass before a change is done.
- No new dependencies without a stated reason in the change's `design.md`.
- Never commit credentials, tokens or `.env` files.
- Never leave `print`, `TODO` or `debugPrint` markers in committed code.
- Branches: `dev` is the integration branch, `main` is the release branch. Never push to either directly.
