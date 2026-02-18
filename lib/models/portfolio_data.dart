class PortfolioData {
  static const name = 'Tarllysson Silva';
  static const title = 'Mobile Software Architect • Flutter Specialist';
  static const location = 'Brasil • Remote Worldwide';

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
      role: 'Flutter Architect',
      company: 'Planserv Beneficiário',
      period: '2024 — Presente',
      bullets: [
        'Evolução da arquitetura mobile de aplicativo de saúde com grande base de usuários.',
        'Integração com APIs REST, Firebase e serviços críticos.',
        'Implementação de estratégias offline-first e sincronização de dados.',
        'Melhoria contínua de performance, estabilidade e experiência do usuário.',
        'Participação ativa na evolução técnica do produto.',
      ],
    ),
    Experience(
      role: 'Mobile Software Architect',
      company: 'TJRS SuperApp Ecosystem',
      period: '2024 — 2025',
      bullets: [
        'Arquitetura Flutter para ecossistema de SuperApp com múltiplos mini-apps modulares.',
        'Definição de padrões arquiteturais, governança técnica e padronização de código.',
        'Criação de estrutura modular escalável utilizando Clean Architecture e separação por domínio.',
        'Integração com múltiplos microserviços e APIs governamentais.',
        'Suporte à evolução contínua da plataforma e aceleração de entregas.',
      ],
    ),
    Experience(
      role: 'Design System & Mobile Architecture',
      company: 'Getnet — Samba Design System',
      period: '2025',
      bullets: [
        'Criação de Design System Flutter com tokens e componentes reutilizáveis.',
        'Padronização visual e técnica entre múltiplos produtos.',
        'Responsavel do TapOn do aplicativo de pagamentos, com mais de 1 milhão de usuários ativos.',
        'Aceleração da produtividade de squads mobile.',
      ],
    ),
    Experience(
      role: 'Software Architect',
      company: 'IARI Internacional',
      period: '2024',
      bullets: [
        'Atuação em arquitetura de software para produtos digitais.',
        'Integração entre aplicações mobile e serviços backend.',
        'Trabalho com equipes distribuídas internacionalmente.',
        'Definição de padrões e boas práticas de desenvolvimento.',
      ],
    ),
    Experience(
      role: 'Flutter Developer (Mid-level) / Mobile Engineer',
      company: 'Peopleware Tecnologia',
      period: '2023 — 2024',
      bullets: [
        'Desenvolvimento e evolução de aplicações Flutter sob demanda com persistência local via SQLite.',
        'Desenvolvimento e evolução de aplicações Flutter sob demanda com persistência local via SQLite.',
        'Refatoração de telas visando melhorias de usabilidade e performance.',
        'Atuação como liderança da frente mobile e organização do projeto.',
        'Diagnóstico e correção de gargalos e bugs complexos.',
        'Implementação de testes automatizados: widget, end-to-end e segurança.',
      ],
    ),
    Experience(
      role: 'UX/UI Designer (Pleno)',
      company: 'Kepha Venture Builder',
      period: '2022 — 2023',
      bullets: [
        'Design de interfaces mobile focadas em experiência do usuário.',
        'Criação de Design Systems e bibliotecas de componentes.',
        'Prototipação e validação de fluxos no Figma.',
        'Colaboração com times de produto e engenharia.',
        'Participação na customização de aplicativos Flutter para clientes diversos.',
      ],
    ),
    Experience(
      role: 'Flutter Engineer / Consultant',
      company: 'Freelance & Consulting',
      period: '2019 — 2023',
      bullets: [
        'Arquitetura e desenvolvimento de aplicações Flutter multiplataforma.',
        'Criação de MVPs e provas de conceito para startups e empresas.',
        'Consultoria técnica em arquitetura mobile e boas práticas.',
        'Projetos nos segmentos fintech, governo, agro e produtos digitais.',
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
      url:
          'https://play.google.com/store/apps/details?id=br.jus.tjrs.superapp.tjrs&pcampaignid=web_share',
      tone: Tone.mint,
    ),
    CaseStudy(
      tag: 'Healthcare App',
      title: 'Planserv Beneficiário',
      description:
          'Evolução da arquitetura mobile de aplicativo de saúde com milhares de usuários. '
          'Melhoria contínua de performance, estabilidade e experiência do usuário.'
          'Foco em performance, qualidade, offline-first e integrações seguras com backend.',
      ctaLabel: 'See Details',
      url:
          'https://play.google.com/store/apps/details?id=com.appdobeneficiario.planserv&pcampaignid=web_share',
      tone: Tone.sand,
    ),
    CaseStudy(
      tag: 'Design System',
      title: 'Getnet Samba Design System',
      description:
          'Criação de Design System Flutter com tokens, componentes e guidelines. '
          'Responsavel do TapOn do aplicativo de pagamentos, com mais de 1 milhão de usuários ativos.'
          'Padronização visual e aceleração do desenvolvimento em múltiplos apps.',
      ctaLabel: 'View System',
      url:
          'https://play.google.com/store/apps/details?id=br.com.getnet.supergetmobile&pcampaignid=web_share',
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
