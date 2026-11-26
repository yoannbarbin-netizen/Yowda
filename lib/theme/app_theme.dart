// lib/theme/app_theme.dart
// Flutter >= 3.27 (CardThemeData, Color.withValues). Sur une version plus ancienne :
// CardTheme au lieu de CardThemeData et withOpacity() au lieu de withValues(alpha:).
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Espacements (grille de 4)
abstract final class Sp {
  static const xs = 4.0, sm = 8.0, md = 12.0, lg = 16.0, xl = 24.0, xxl = 32.0;
}

/// Rayons
abstract final class Rd {
  static const sm = 12.0, md = 16.0, lg = 24.0, xl = 28.0, pill = 999.0;
}

/// Couleurs métier (catégories, succès) : extensible, il suffit d'ajouter un champ.
@immutable
class CategoryColors extends ThemeExtension<CategoryColors> {
  const CategoryColors({
    required this.warmup,
    required this.gym,
    required this.home,
    required this.bodyweight,
    required this.stretching,
    required this.success,
    required this.crossfit,
  });

  final Color warmup, gym, home, bodyweight, stretching, success, crossfit;

  static const dark = CategoryColors(
    warmup: Color(0xFFFFB547),
    gym: Color(0xFFFF6B35),
    home: Color(0xFF8B8CFF),
    bodyweight: Color(0xFF3DDC97),
    stretching: Color(0xFF5BC0FF),
    success: Color(0xFFB8F25B),
    crossfit: Color(0xFFE85D9E),
  );

  static const light = CategoryColors(
    warmup: Color(0xFFB45309),
    gym: Color(0xFFC2410C),
    home: Color(0xFF4F46E5),
    bodyweight: Color(0xFF047857),
    stretching: Color(0xFF0369A1),
    success: Color(0xFF4D7C0F),
    crossfit: Color(0xFFBE185D),
  );

  @override
  CategoryColors copyWith({
    Color? warmup,
    Color? gym,
    Color? home,
    Color? bodyweight,
    Color? stretching,
    Color? success,
    Color? crossfit,
  }) =>
      CategoryColors(
        warmup: warmup ?? this.warmup,
        gym: gym ?? this.gym,
        home: home ?? this.home,
        bodyweight: bodyweight ?? this.bodyweight,
        stretching: stretching ?? this.stretching,
        success: success ?? this.success,
        crossfit: crossfit ?? this.crossfit,
      );

  @override
  CategoryColors lerp(ThemeExtension<CategoryColors>? other, double t) {
    if (other is! CategoryColors) return this;
    return CategoryColors(
      warmup: Color.lerp(warmup, other.warmup, t)!,
      gym: Color.lerp(gym, other.gym, t)!,
      home: Color.lerp(home, other.home, t)!,
      bodyweight: Color.lerp(bodyweight, other.bodyweight, t)!,
      stretching: Color.lerp(stretching, other.stretching, t)!,
      success: Color.lerp(success, other.success, t)!,
      crossfit: Color.lerp(crossfit, other.crossfit, t)!,
    );
  }
}

abstract final class AppTheme {
  static ThemeData light() => _build(_lightScheme, CategoryColors.light);
  static ThemeData dark() => _build(_darkScheme, CategoryColors.dark);

  // ---------- Mode sombre (par défaut) ----------
  static const _darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFF6B35),
    onPrimary: Color(0xFF1A0A03),
    primaryContainer: Color(0xFF3A1B0D),
    onPrimaryContainer: Color(0xFFFFD9CB),
    secondary: Color(0xFFB8F25B),
    onSecondary: Color(0xFF11190A),
    secondaryContainer: Color(0xFF2A3A12),
    onSecondaryContainer: Color(0xFFDDF9A8),
    tertiary: Color(0xFF5BC0FF),
    onTertiary: Color(0xFF00202F),
    error: Color(0xFFD92D33),
    onError: Colors.white,
    errorContainer: Color(0xFF3B1214),
    onErrorContainer: Color(0xFFFFB4B0),
    surface: Color(0xFF0E0F13),
    onSurface: Color(0xFFF4F5F7),
    onSurfaceVariant: Color(0xFFA3A8B5),
    surfaceContainerLowest: Color(0xFF0A0B0E),
    surfaceContainerLow: Color(0xFF13151A),
    surfaceContainer: Color(0xFF171920),
    surfaceContainerHigh: Color(0xFF20232C),
    surfaceContainerHighest: Color(0xFF2A2E39),
    outline: Color(0xFF5B6070),
    outlineVariant: Color(0xFF2C303B),
    shadow: Colors.black,
    scrim: Colors.black,
    inverseSurface: Color(0xFFF4F5F7),
    onInverseSurface: Color(0xFF0E0F13),
    inversePrimary: Color(0xFFC2410C),
  );

  // ---------- Mode clair (fond chaud) ----------
  static const _lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFC2410C),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFFFE0D3),
    onPrimaryContainer: Color(0xFF3A1200),
    secondary: Color(0xFF4D7C0F),
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFDDF3B5),
    onSecondaryContainer: Color(0xFF172600),
    tertiary: Color(0xFF0369A1),
    onTertiary: Colors.white,
    error: Color(0xFFD92D33),
    onError: Colors.white,
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    surface: Color(0xFFFFF8F5),
    onSurface: Color(0xFF1B1410),
    onSurfaceVariant: Color(0xFF6B5B52),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFFFFBF8),
    surfaceContainer: Color(0xFFFFFFFF),
    surfaceContainerHigh: Color(0xFFFBEFE9),
    surfaceContainerHighest: Color(0xFFF5E6DE),
    outline: Color(0xFF8C7B71),
    outlineVariant: Color(0xFFEBD8CF),
    shadow: Colors.black,
    scrim: Colors.black,
    inverseSurface: Color(0xFF2B211C),
    onInverseSurface: Color(0xFFFFF8F5),
    inversePrimary: Color(0xFFFF6B35),
  );

  static ThemeData _build(ColorScheme s, CategoryColors cats) {
    final base = ThemeData(useMaterial3: true, colorScheme: s);
    final text = _textTheme(base.textTheme, s);
    final isDark = s.brightness == Brightness.dark;

    return base.copyWith(
      scaffoldBackgroundColor: s.surface,
      textTheme: text,
      extensions: [cats],
      splashFactory: InkSparkle.splashFactory,

      appBarTheme: AppBarTheme(
        backgroundColor: s.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: text.titleLarge,
        systemOverlayStyle:
            isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),

      cardTheme: CardThemeData(
        color: s.surfaceContainer,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Rd.lg),
          side: BorderSide(color: s.outlineVariant),
        ),
      ),

      // Bouton principal : pilule pleine, 56 dp, une seule par écran
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          shape: const StadiumBorder(),
          textStyle: text.labelLarge,
        ),
      ),
      // Bouton secondaire : contour
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: const StadiumBorder(),
          side: BorderSide(color: s.outline),
          textStyle: text.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(textStyle: text.labelLarge),
      ),

      chipTheme: ChipThemeData(
        shape: const StadiumBorder(),
        side: BorderSide(color: s.outlineVariant),
        backgroundColor: s.surfaceContainer,
        selectedColor: s.primaryContainer,
        labelStyle: text.labelLarge,
      ),

      navigationBarTheme: NavigationBarThemeData(
        height: 72,
        backgroundColor: s.surfaceContainer,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        indicatorColor: s.primaryContainer,
        indicatorShape: const StadiumBorder(),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return text.labelSmall!.copyWith(
            color: selected ? s.primary : s.onSurfaceVariant,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            size: 26,
            color: selected ? s.primary : s.onSurfaceVariant,
          );
        }),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: s.surfaceContainerHigh,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: Sp.lg, vertical: Sp.md),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Rd.md),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Rd.md),
          borderSide: BorderSide(color: s.primary, width: 1.5),
        ),
      ),

      dividerTheme: DividerThemeData(
        color: s.outlineVariant,
        space: 1,
        thickness: 1,
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: s.secondary,
        circularTrackColor: s.surfaceContainerHigh,
        linearTrackColor: s.surfaceContainerHigh,
      ),
    );
  }

  static TextTheme _textTheme(TextTheme base, ColorScheme s) {
    // En test (flutter test), google_fonts ne peut pas charger les polices
    // (pas de réseau ni d'assets) : on garde la police par défaut.
    if (Platform.environment.containsKey('FLUTTER_TEST')) return base;
    // Construit les styles un par un (on évite volontairement l'API TextTheme de
    // google_fonts : elle n'est pas compatible entre flutter/material et material_ui).
    TextStyle jakarta({
      required double size,
      required FontWeight weight,
      double height = 1.4,
      double letterSpacing = 0,
    }) =>
        GoogleFonts.plusJakartaSans(
          fontSize: size,
          fontWeight: weight,
          height: height,
          letterSpacing: letterSpacing,
          color: s.onSurface,
        );

    // Chiffres : Space Grotesk + chiffres tabulaires (pas de saut du chrono)
    TextStyle figure(double size) => GoogleFonts.spaceGrotesk(
          fontSize: size,
          fontWeight: FontWeight.w700,
          height: 1.0,
          letterSpacing: -1,
          color: s.onSurface,
          fontFeatures: const [FontFeature.tabularFigures()],
        );

    return base.copyWith(
      displayLarge: figure(72), // chrono de séance
      displayMedium: figure(48), // gros chiffres du récap
      displaySmall: figure(36),
      headlineMedium: jakarta(size: 28, weight: FontWeight.w800, height: 1.15),
      titleLarge: jakarta(size: 22, weight: FontWeight.w700, height: 1.25),
      titleMedium: jakarta(size: 17, weight: FontWeight.w700, height: 1.3),
      bodyLarge: jakarta(size: 16, weight: FontWeight.w500),
      bodyMedium: jakarta(size: 14, weight: FontWeight.w500),
      labelLarge: jakarta(size: 15, weight: FontWeight.w700, letterSpacing: 0.1),
      labelSmall: jakarta(size: 12, weight: FontWeight.w600, letterSpacing: 0.4),
    );
  }
}
