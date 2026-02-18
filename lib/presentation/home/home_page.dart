import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/models/portfolio_data.dart';
import 'package:portfolio/presentation/widgets/animated_reveal.dart';
import 'package:portfolio/presentation/widgets/hero_section.dart';
import 'package:url_launcher/url_launcher.dart';

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
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {}
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
                    ListTile(
                        title: const Text('Trabalhos'),
                        onTap: () => _go(_kWork)),
                    ListTile(
                        title: const Text('Sobre'), onTap: () => _go(_kAbout)),
                    ListTile(
                        title: const Text('Experiência'),
                        onTap: () => _go(_kExperience)),
                    ListTile(
                        title: const Text('Habilidades'),
                        onTap: () => _go(_kSkills)),
                    const Divider(),
                    ListTile(
                        title: const Text('Contato'),
                        onTap: () => _go(_kContact)),
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
                  child: HeroSection(key: _kHero, onOpen: _open)),

              /// WORK
              SliverToBoxAdapter(
                child: SectionShell(
                  sectionKey: _kWork,
                  eyebrow: 'Trabalhos selecionados',
                  title: 'Estudos de caso e resultados',
                  child: LayoutBuilder(builder: (context, c) {
                    final cols =
                        c.maxWidth >= 1000 ? 3 : (c.maxWidth >= 700 ? 2 : 1);

                    return MasonryGridView.count(
                      crossAxisCount: cols,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      itemCount: PortfolioData.caseStudies.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) => CaseStudyCard(
                        data: PortfolioData.caseStudies[i],
                        onPressed: () =>
                            _open(PortfolioData.caseStudies[i].url),
                      ),
                    );
                  }),
                ),
              ),

              /// ABOUT
              /// ABOUT
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
                            color: context.tokens.ink.withOpacity(0.86),
                            fontSize: 16,
                            height: 1.45,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 16),

                        /// CHIPS DE HIGHLIGHTS
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: PortfolioData.highlights.map((h) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text(
                                h,
                                style: TextStyle(
                                  color: context.tokens.ink.withOpacity(0.9),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// EXPERIENCE
              SliverToBoxAdapter(
                child: SectionShell(
                  sectionKey: _kExperience,
                  eyebrow: 'Experiência',
                  title: 'Liderança, governança e entrega',
                  child: LayoutBuilder(
                    builder: (context, c) {
                      final cols =
                          c.maxWidth >= 980 ? 3 : (c.maxWidth >= 680 ? 2 : 1);

                      return MasonryGridView.count(
                        crossAxisCount: cols,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        itemCount: PortfolioData.experiences.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) => AnimatedReveal(
                          index: i,
                          child: ExperienceTile(
                            data: PortfolioData.experiences[i],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              /// SKILLS
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

              /// CONTACT (ADICIONADO)
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
