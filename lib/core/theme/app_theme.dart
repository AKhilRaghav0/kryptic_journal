import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  // Hybrid color palette - combining all three platforms
  static const Color primaryAccent = Color(0xFF1BA1E2); // Windows Phone Blue
  static const Color backgroundWhite = Color(0xFFFFFFFF); // iOS Clean
  static const Color backgroundGray = Color(0xFFF5F5F5); // iOS Light Gray
  static const Color surfaceElevated = Color(0xFFFAFAFA); // Android Surface
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textLight = Color(0xFFBBBBBB);

  // Hybrid Live Tile Colors (Windows Phone inspired)
  static const Color tileGreen = Color(0xFF00C851); // More vibrant
  static const Color tileBlue = Color(0xFF1BA1E2);
  static const Color tileOrange = Color(0xFFFF6900); // More modern
  static const Color tilePurple = Color(0xFF9C27B0); // Material Purple
  static const Color tileRed = Color(0xFFE53935); // Material Red
  static const Color tileTeal = Color(0xFF00BCD4); // Material Teal
  static const Color tileMagenta = Color(0xFFE91E63); // Material Pink
  static const Color tileBrown = Color(0xFF795548); // Material Brown
  static const Color tileIndigo = Color(0xFF3F51B5); // Material Indigo
  static const Color tileDeepOrange = Color(0xFFFF5722); // Material Deep Orange

  // iOS-inspired shadows and elevation
  static List<BoxShadow> get iosShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.08),
      blurRadius: 20,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  // Android-inspired elevation
  static List<BoxShadow> get materialElevation => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  static ThemeData hybridTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Outfit', // Using Outfit font throughout the app
    colorScheme: const ColorScheme.light(
      primary: primaryAccent,
      secondary: tileGreen,
      surface: backgroundWhite,
      surfaceContainerLowest: backgroundGray,
      surfaceContainer: surfaceElevated,
      onPrimary: backgroundWhite,
      onSecondary: backgroundWhite,
      onSurface: textPrimary,
      onSurfaceVariant: textSecondary,
    ),

    scaffoldBackgroundColor: backgroundGray,

    // Hybrid Typography - Windows Phone + iOS + Android
    textTheme: const TextTheme(
      // Windows Phone inspired headers with iOS refinement
      displayLarge: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 64,
        fontWeight: FontWeight.w700,
        letterSpacing: -2.0,
        color: textPrimary,
        height: 0.9,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 42,
        fontWeight: FontWeight.w700,
        letterSpacing: -1.2,
        color: textPrimary,
        height: 0.95,
      ),
      // Modern section headers
      headlineLarge: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 36,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.8,
        color: textPrimary,
        height: 1.1,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        color: textPrimary,
        height: 1.15,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        height: 1.2,
      ),
      // Body text with Android clarity
      bodyLarge: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: textPrimary,
        height: 1.4,
        letterSpacing: 0.1,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: textPrimary,
        height: 1.45,
        letterSpacing: 0.15,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: textSecondary,
        height: 1.35,
        letterSpacing: 0.2,
      ),
      // Labels with Windows Phone character
      labelLarge: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        height: 1.25,
        letterSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textSecondary,
        height: 1.3,
        letterSpacing: 0.15,
      ),
    ),

    // iOS-inspired app bar
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundWhite,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: const TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: -0.8,
        height: 1.1,
      ),
      shadowColor: Colors.black.withValues(alpha: 0.1),
    ),

    // Hybrid card design - iOS corners + Android elevation + Windows Phone colors
    cardTheme: CardThemeData(
      color: backgroundWhite,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // iOS-style rounded corners
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    ),

    // Modern input fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceElevated,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14), // iOS-inspired
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: primaryAccent, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      hintStyle: const TextStyle(
        color: textSecondary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),

    // Android-inspired FAB
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryAccent,
      foregroundColor: backgroundWhite,
      elevation: 8,
      highlightElevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),

    // Material design bottom navigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: backgroundWhite,
      selectedItemColor: primaryAccent,
      unselectedItemColor: textLight,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
  );

  // Get the main theme
  static ThemeData get lightTheme => hybridTheme;
}

// Enhanced Metro Colors with more variety
class MetroColors {
  static const List<Color> liveTileColors = [
    AppTheme.tileBlue,
    AppTheme.tileGreen,
    AppTheme.tileOrange,
    AppTheme.tilePurple,
    AppTheme.tileRed,
    AppTheme.tileTeal,
    AppTheme.tileMagenta,
    AppTheme.tileBrown,
    AppTheme.tileIndigo,
    AppTheme.tileDeepOrange,
  ];

  static Color getLiveTileColor(int index) {
    return liveTileColors[index % liveTileColors.length];
  }

  // Gradient combinations for modern cards
  static LinearGradient getGradient(int index) {
    final gradients = [
      LinearGradient(
        colors: [AppTheme.tileBlue, AppTheme.tileTeal],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      LinearGradient(
        colors: [AppTheme.tilePurple, AppTheme.tileMagenta],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      LinearGradient(
        colors: [AppTheme.tileOrange, AppTheme.tileRed],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      LinearGradient(
        colors: [AppTheme.tileGreen, AppTheme.tileTeal],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ];
    return gradients[index % gradients.length];
  }
}
