import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() {
    const bg = Color(0xFFF7F7F7);
    const card = Colors.white;
    const ink = Color(0xFF111111);
    const subtle = Color(0xFF6B6B6B);

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF111111),
        brightness: Brightness.light,
        // ignore: deprecated_member_use
        background: bg,
        surface: card,
      ),
      scaffoldBackgroundColor: bg,
    );

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: ink,
        displayColor: ink,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardTheme(
        color: card,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      dividerTheme: const DividerThemeData(color: Color(0xFFE9E9E9)),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: const Color(0xFFF0F0F0),
        labelStyle: const TextStyle(color: ink),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ink,
        selectionColor: Color(0x22111111),
        selectionHandleColor: ink,
      ),
      extensions: const <ThemeExtension<dynamic>>[
        _AppTokens(ink: ink, subtle: subtle),
      ],
    );
  }
}

class _AppTokens extends ThemeExtension<_AppTokens> {
  final Color ink;
  final Color subtle;

  const _AppTokens({required this.ink, required this.subtle});

  @override
  _AppTokens copyWith({Color? ink, Color? subtle}) =>
      _AppTokens(ink: ink ?? this.ink, subtle: subtle ?? this.subtle);

  @override
  _AppTokens lerp(ThemeExtension<_AppTokens>? other, double t) {
    if (other is! _AppTokens) return this;
    return _AppTokens(
      ink: Color.lerp(ink, other.ink, t) ?? ink,
      subtle: Color.lerp(subtle, other.subtle, t) ?? subtle,
    );
  }
}

extension AppTokensX on BuildContext {
  _AppTokens get tokens => Theme.of(this).extension<_AppTokens>()!;
}
