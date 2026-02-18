import 'package:flutter/material.dart';

class PremiumBackground extends StatelessWidget {
  final Widget child;
  const PremiumBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// base color
        Container(color: const Color(0xFFF7F7F7)),

        /// TOP RIGHT glow
        Positioned(
          top: -200,
          right: -200,
          child: _Glow(
            size: 500,
            color: const Color(0xFF7C5CFF).withOpacity(0.18),
          ),
        ),

        /// LEFT glow
        Positioned(
          top: 200,
          left: -250,
          child: _Glow(
            size: 600,
            color: const Color(0xFF00C2FF).withOpacity(0.15),
          ),
        ),

        /// BOTTOM glow
        Positioned(
          bottom: -250,
          right: 100,
          child: _Glow(
            size: 600,
            color: const Color(0xFFFF7AD9).withOpacity(0.12),
          ),
        ),

        child,
      ],
    );
  }
}

class _Glow extends StatelessWidget {
  final double size;
  final Color color;

  const _Glow({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color,
              color.withOpacity(0.0),
            ],
          ),
        ),
      ),
    );
  }
}
