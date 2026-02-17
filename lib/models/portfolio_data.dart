class PortfolioData {
  static const name = 'Tarllysson Silva';
  static const title = 'Mobile Software Architect • Flutter Specialist';
  static const location = 'Brazil • Remote Worldwide';

  static const summary =
      'Mobile Software Architect especializado em Flutter com foco em aplicações de grande escala, '
      'SuperApps e Design Systems. Experiência liderando arquitetura, governança técnica e padronização '
      'de código em ambientes corporativos, financeiros e governamentais.';

  static const links = <Link>[
    Link(
        label: 'LinkedIn',
        url: 'https://www.linkedin.com/in/tharllyson-silva/'),
    Link(label: 'GitHub', url: 'https://github.com/TharllysonSilva'),
    Link(label: 'Behance', url: 'https://www.behance.net/tharllysonsilva'),
    Link(label: 'Email', url: 'mailto:tarllyssondesigner@gmail.com'),
  ];

  // HIGHLIGHTS ARQUITETURA
  static const highlights = <String>[
    'Arquitetura Flutter para SuperApps e Mini-Apps',
    'Clean Architecture + Modularização por domínio (Melos)',
    'Design Systems e governança de UI em larga escala',
    'Offline-first + sincronização de dados',
    'CI/CD, qualidade, performance e observabilidade',
  ];

  // SKILLS MAIS EXECUTIVAS
  static const skills = <String>[
    'Flutter',
    'Dart',
    'Clean Architecture',
    'DDD',
    'SOLID',
    'BLoC / Cubit',
    'Riverpod',
    'Modular Monorepo',
    'Design Systems',
    'CI/CD',
    'Firebase',
    'REST / GraphQL',
    'Offline-first',
    'SQLite / Drift / Isar',
    'Feature Flags',
    'Remote Config',
    'Crashlytics',
    'Scalable Mobile Architecture',
  ];

  // EXPERIÊNCIAS MAIS RELEVANTES
  static const experiences = <Experience>[
    Experience(
      role: 'Mobile Software Architect',
      company: 'TJRS SuperApp Ecosystem',
      period: '2024 — 2025',
      bullets: [
        'Arquitetura modular para SuperApp com múltiplos mini-apps Flutter.',
        'Definição de padrões, governança e escalabilidade do ecossistema.',
        'Integrações seguras com microserviços e serviços governamentais.',
      ],
    ),
    Experience(
      role: 'Flutter Architect',
      company: 'Planserv Beneficiário',
      period: '2023 — 2024',
      bullets: [
        'Evolução da arquitetura mobile de app de saúde com grande base de usuários.',
        'Melhoria de performance, qualidade e estabilidade da aplicação.',
        'Integração com APIs, Firebase e serviços críticos.',
      ],
    ),
    Experience(
      role: 'Design System & Mobile Architecture',
      company: 'Getnet — Samba Design System',
      period: '2023',
      bullets: [
        'Criação de Design System Flutter com tokens e componentes reutilizáveis.',
        'Padronização visual e técnica entre múltiplos produtos.',
        'Aceleração da produtividade de squads mobile.',
      ],
    ),
  ];

  // ⭐ CASE STUDIES PRINCIPAIS
  static const caseStudies = <CaseStudy>[
    CaseStudy(
      tag: 'SuperApp Architecture',
      title: 'TJRS SuperApp Ecosystem',
      description:
          'Arquitetura Flutter para SuperApp governamental com mini-apps modulares. '
          'Definição de padrões, modularização por domínio e governança técnica '
          'para garantir escalabilidade e evolução contínua da plataforma.',
      ctaLabel: 'View Architecture',
      url: 'https://www.linkedin.com/in/tharllyson-silva/',
      tone: Tone.mint,
    ),
    CaseStudy(
      tag: 'Healthcare App',
      title: 'Planserv Beneficiário',
      description:
          'Evolução da arquitetura mobile de aplicativo de saúde com milhares de usuários. '
          'Foco em performance, qualidade, offline-first e integrações seguras com backend.',
      ctaLabel: 'See Details',
      url: 'https://www.linkedin.com/in/tharllyson-silva/',
      tone: Tone.sand,
    ),
    CaseStudy(
      tag: 'Design System',
      title: 'Getnet Samba Design System',
      description:
          'Criação de Design System Flutter com tokens, componentes e guidelines. '
          'Padronização visual e aceleração do desenvolvimento em múltiplos apps.',
      ctaLabel: 'View System',
      url: 'https://www.behance.net/tharllysonsilva',
      tone: Tone.lavender,
    ),
  ];
}

class Link {
  final String label;
  final String url;
  const Link({required this.label, required this.url});
}

class Experience {
  final String role;
  final String company;
  final String period;
  final List<String> bullets;
  const Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.bullets,
  });
}

class CaseStudy {
  final String tag;
  final String title;
  final String description;
  final String ctaLabel;
  final String url;
  final Tone tone;

  const CaseStudy({
    required this.tag,
    required this.title,
    required this.description,
    required this.ctaLabel,
    required this.url,
    required this.tone,
  });
}

enum Tone { mint, sand, lavender }
