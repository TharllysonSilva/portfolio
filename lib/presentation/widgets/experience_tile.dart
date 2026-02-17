import 'package:flutter/material.dart';
import '../../models/portfolio_data.dart' show Experience;
import '../../theme/app_theme.dart';

class ExperienceTile extends StatelessWidget {
  final Experience data;

  const ExperienceTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFEDEDED)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.period,
            style: TextStyle(
              color: t.subtle,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.role,
            style: TextStyle(
              color: t.ink,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.6,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data.company,
            style: TextStyle(
              color: t.ink.withOpacity(0.85),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ...data.bullets.map(
            (b) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Icons.circle, size: 7, color: Color(0xFF111111)),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
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
    );
  }
}
