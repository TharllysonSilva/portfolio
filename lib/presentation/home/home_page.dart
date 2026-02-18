import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/models/portfolio_data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/portfolio_data.dart';
import '../../theme/app_theme.dart';
import '../../utils/scroll_to_key.dart';
import '../widgets/pill_navbar.dart';
import '../widgets/section_shell.dart';
import '../widgets/case_study_card.dart';
import '../widgets/experience_tile.dart';
import '../widgets/skill_chip.dart';
import '../widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scroll = ScrollController();

  final _kHero = GlobalKey();
  final _kWork = GlobalKey();
  final _kAbout = GlobalKey();
  final _kExperience = GlobalKey();
  final _kSkills = GlobalKey();
  final _kContact = GlobalKey();

  Future<void> _go(GlobalKey key) => scrollToKey(
        key: key,
        controller: _scroll,
        duration: const Duration(milliseconds: 650),
        topPadding: 90,
      );

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      // ignore silently
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final isMobile = MediaQuery.of(context).size.width < 860;

    final navItems = [
      NavItem(label: 'Trabalhos', onPressed: () => _go(_kWork)),
      NavItem(label: 'Sobre', onPressed: () => _go(_kAbout)),
      NavItem(label: 'Experiência', onPressed: () => _go(_kExperience)),
      NavItem(label: 'Habilidades', onPressed: () => _go(_kSkills)),
      NavItem(label: 'Contato', onPressed: () => _go(_kContact)),
    ];

    return Scaffold(
      endDrawer: isMobile
          ? Drawer(
              child: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.all(12),
                  children: [
                    const SizedBox(height: 6),
                    ListTile(
                      title: const Text('Trabalhos',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                      onTap: () {
                        Navigator.pop(context);
                        _go(_kWork);
                      },
                    ),
                    ListTile(
                      title: const Text('Sobre',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                      onTap: () {
                        Navigator.pop(context);
                        _go(_kAbout);
                      },
                    ),
                    ListTile(
                      title: const Text('Experiência',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                      onTap: () {
                        Navigator.pop(context);
                        _go(_kExperience);
                      },
                    ),
                    ListTile(
                      title: const Text('Habilidades',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                      onTap: () {
                        Navigator.pop(context);
                        _go(_kSkills);
                      },
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Entre em contato',
                          style: TextStyle(fontWeight: FontWeight.w900)),
                      onTap: () {
                        Navigator.pop(context);
                        _go(_kContact);
                      },
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scroll,
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 90)),
              SliverToBoxAdapter(
                  child: _HeroSection(key: _kHero, onOpen: _open)),
              SliverToBoxAdapter(
                child: SectionShell(
                  sectionKey: _kWork,
                  eyebrow: 'Trabalhos selecionados',
                  title: 'Estudos de caso e resultados',
                  child: LayoutBuilder(
                    builder: (context, c) {
                      final w = c.maxWidth;
                      final cols = w >= 1000 ? 3 : (w >= 700 ? 2 : 1);
                      return MasonryGridView.count(
                        crossAxisCount: cols,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        itemCount: PortfolioData.caseStudies.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          final cs = PortfolioData.caseStudies[i];
                          return CaseStudyCard(
                            data: cs,
                            onPressed: () => _open(cs.url),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionShell(
                  sectionKey: _kAbout,
                  eyebrow: 'Sobre',
                  title: 'Arquitetura em primeiro lugar. Foco no produto.',
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: const Color(0xFFEDEDED)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          PortfolioData.summary,
                          style: TextStyle(
                            color: t.ink.withOpacity(0.86),
                            fontSize: 16,
                            height: 1.45,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: PortfolioData.highlights
                              .map(
                                (h) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Text(
                                    h,
                                    style: TextStyle(
                                      color: t.ink.withOpacity(0.9),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionShell(
                  sectionKey: _kExperience,
                  eyebrow: 'Experiência',
                  title: 'Liderança, governança e entrega',
                  child: LayoutBuilder(
                    builder: (context, c) {
                      final w = c.maxWidth;
                      final cols = w >= 980 ? 3 : (w >= 680 ? 2 : 1);

                      return GridView.builder(
                        itemCount: PortfolioData.experiences.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: cols,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          mainAxisExtent: cols == 1 ? 420 : 390, // ⭐ SOLUÇÃO
                        ),
                        itemBuilder: (context, i) =>
                            ExperienceTile(data: PortfolioData.experiences[i]),
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionShell(
                  sectionKey: _kSkills,
                  eyebrow: 'Habilidades',
                  title: 'Ferramentas e padrões que eu forneço',
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: PortfolioData.skills
                        .map((s) => SkillChip(label: s))
                        .toList(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionShell(
                  sectionKey: _kContact,
                  eyebrow: 'Contato',
                  title: 'Vamos construir algo escalável.',
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: const Color(0xFFEDEDED)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Me chama para conversar sobre arquitetura, modularização, qualidade e delivery.',
                          style: TextStyle(
                            color: t.ink.withOpacity(0.86),
                            fontSize: 16,
                            height: 1.45,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: PortfolioData.links
                              .map(
                                (l) => OutlinedButton(
                                  onPressed: () => _open(l.url),
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Color(0xFFE1E1E1)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                  ),
                                  child: Text(
                                    l.label,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: Footer()),
            ],
          ),

          // top navbar overlay
          SafeArea(
            child: Builder(
              builder: (context) => PillNavBar(
                items: navItems,
                isMobile: isMobile,
                onTapMenu: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  final Future<void> Function(String url) onOpen;

  const _HeroSection({super.key, required this.onOpen});

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
              crossAxisAlignment: isNarrow
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
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
                            borderRadius: BorderRadius.circular(999)),
                      ),
                      child: const Text('LinkedIn',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                    OutlinedButton(
                      onPressed: () => onOpen(PortfolioData.links[1].url),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFE1E1E1)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999)),
                      ),
                      child: const Text('GitHub',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                    OutlinedButton(
                      onPressed: () => onOpen(PortfolioData.links.last.url),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFE1E1E1)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999)),
                      ),
                      child: const Text('Email',
                          style: TextStyle(fontWeight: FontWeight.w800)),
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
              style:
                  TextStyle(fontWeight: FontWeight.w900, letterSpacing: -0.3),
            ),
          ],
        ),
      ],
    );
  }
}
