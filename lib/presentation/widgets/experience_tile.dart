import 'package:flutter/material.dart';
import '../../models/portfolio_data.dart' show Experience;
import '../../theme/app_theme.dart';

class ExperienceTile extends StatefulWidget {
  final Experience data;

  const ExperienceTile({super.key, required this.data});

  @override
  State<ExperienceTile> createState() => _ExperienceTileState();
}

class _ExperienceTileState extends State<ExperienceTile> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        transform: Matrix4.identity()
          ..translate(0.0, _hover ? -8 : 0.0)
          ..scale(_hover ? 1.015 : 1.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFEDEDED)),
          boxShadow: [
            if (_hover)
              const BoxShadow(
                blurRadius: 30,
                offset: Offset(0, 14),
                color: Color.fromARGB(45, 0, 0, 0),
              ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.period,
                style: TextStyle(
                  color: t.subtle,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.data.role,
                style: TextStyle(
                  color: t.ink,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.6,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.data.company,
                style: TextStyle(
                  color: t.ink.withOpacity(0.85),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),

              /// bullets
              ...widget.data.bullets.map(
                (b) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Icon(Icons.circle,
                            size: 7, color: Color(0xFF111111)),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          b,
                          style: TextStyle(
                            color: t.ink.withOpacity(0.84),
                            height: 1.35,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
