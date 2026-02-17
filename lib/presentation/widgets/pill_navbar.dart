import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PillNavBar extends StatelessWidget {
  final List<NavItem> items;
  final VoidCallback onTapMenu; // mobile
  final bool isMobile;

  const PillNavBar({
    super.key,
    required this.items,
    required this.onTapMenu,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.92),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: const Color(0xFFEDEDED)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 22,
                  offset: const Offset(0, 10),
                  color: Colors.black.withOpacity(0.06),
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  'TS',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                    color: t.ink,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: isMobile
                      ? Text(
                          'Portfolio',
                          style: TextStyle(
                            color: t.subtle,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: items
                              .map(
                                (e) => _PillButton(
                                  label: e.label,
                                  onPressed: e.onPressed,
                                ),
                              )
                              .toList(),
                        ),
                ),
                const SizedBox(width: 8),
                if (isMobile)
                  IconButton(
                    onPressed: onTapMenu,
                    icon: const Icon(Icons.menu_rounded),
                    tooltip: 'Menu',
                  )
                else
                  _PrimaryPill(
                    label: 'Get in touch',
                    onPressed: items.last.onPressed,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem {
  final String label;
  final VoidCallback onPressed;
  const NavItem({required this.label, required this.onPressed});
}

class _PillButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _PillButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        foregroundColor: t.ink,
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _PrimaryPill extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _PrimaryPill({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: t.ink,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
    );
  }
}
