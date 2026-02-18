import 'package:flutter/material.dart';
import '../../models/portfolio_data.dart' show CaseStudy, Tone;
import '../../theme/app_theme.dart';

class CaseStudyCard extends StatefulWidget {
  final CaseStudy data;
  final VoidCallback onPressed;

  const CaseStudyCard({
    super.key,
    required this.data,
    required this.onPressed,
  });

  @override
  State<CaseStudyCard> createState() => _CaseStudyCardState();
}

class _CaseStudyCardState extends State<CaseStudyCard> {
  bool _hover = false;

  Color toneColor(Tone tone) {
    switch (tone) {
      case Tone.mint:
        return const Color(0xFFE7F6F0);
      case Tone.sand:
        return const Color(0xFFFFF2E1);
      case Tone.lavender:
        return const Color(0xFFF1ECFF);
    }
  }

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
          color: toneColor(widget.data.tone),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.white.withOpacity(0.8)),
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
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.tag,
                style: TextStyle(
                  color: t.subtle,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.data.title,
                style: TextStyle(
                  color: t.ink,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.8,
                  fontSize: 22,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.data.description,
                style: TextStyle(
                  color: t.ink.withOpacity(0.84),
                  height: 1.35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: widget.onPressed,
                style: FilledButton.styleFrom(
                  backgroundColor: t.ink,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                child: Text(
                  widget.data.ctaLabel,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
