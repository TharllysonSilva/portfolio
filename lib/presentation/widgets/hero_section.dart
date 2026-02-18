import 'package:flutter/material.dart';
import 'package:portfolio/models/portfolio_data.dart';
import 'package:portfolio/theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final Future<void> Function(String url) onOpen;

  const HeroSection({super.key, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final w = MediaQuery.of(context).size.width;
    final isNarrow = w < 820;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 28, 16, 22),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 520),
            curve: Curves.easeOutCubic,
            builder: (context, v, child) => Opacity(
              opacity: v,
              child: Transform.translate(
                offset: Offset(0, (1 - v) * 14),
                child: child,
              ),
            ),
            child: Column(
              key: const ValueKey('hero'),
              crossAxisAlignment:
                  isNarrow ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 4),
                _AvatarBlock(isNarrow: isNarrow),
                const SizedBox(height: 18),
                Text(
                  PortfolioData.name,
                  textAlign: isNarrow ? TextAlign.left : TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -2.2,
                    fontSize: isNarrow ? 44 : 64,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  PortfolioData.title,
                  textAlign: isNarrow ? TextAlign.left : TextAlign.center,
                  style: TextStyle(
                    color: t.ink.withOpacity(0.82),
                    fontWeight: FontWeight.w600,
                    fontSize: isNarrow ? 16 : 18,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  PortfolioData.location,
                  textAlign: isNarrow ? TextAlign.left : TextAlign.center,
                  style: TextStyle(
                    color: t.subtle,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 18),
                Wrap(
                  alignment:
                      isNarrow ? WrapAlignment.start : WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    FilledButton(
                      onPressed: () => onOpen(PortfolioData.links.first.url),
                      style: FilledButton.styleFrom(
                        backgroundColor: t.ink,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: const Text(
                        'LinkedIn',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () => onOpen(PortfolioData.links[1].url),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFE1E1E1)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: const Text(
                        'GitHub',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () => onOpen(PortfolioData.links.last.url),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFE1E1E1)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: const Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xFFEDEDED),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AvatarBlock extends StatelessWidget {
  final bool isNarrow;

  const _AvatarBlock({required this.isNarrow});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;

    return Row(
      mainAxisAlignment:
          isNarrow ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 36,
          backgroundColor: t.ink,
          child: const Text(
            'TS',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 18,
              letterSpacing: -0.5,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available for',
              style: TextStyle(color: t.subtle, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            const Text(
              'Architecture • Tech Lead • Consulting',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
