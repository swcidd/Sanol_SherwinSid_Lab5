import 'package:flutter/material.dart';

const Color imperialBlue = Color(0xFF00296B);
const Color frenchBlue = Color(0xFF003F88);
const Color steelAzure = Color(0xFF00509D);
const Color schoolBusYellow = Color(0xFFFDC500);
const Color gold = Color(0xFFFFD500);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Club Membership Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: imperialBlue).copyWith(
          primary: schoolBusYellow,
          secondary: frenchBlue,
          tertiary: steelAzure,
          surface: Colors.white,
          onPrimary: imperialBlue,
          onSecondary: gold,
          onSurface: imperialBlue,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F9FE),
        appBarTheme: const AppBarTheme(
          backgroundColor: imperialBlue,
          foregroundColor: Colors.white,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: schoolBusYellow,
            foregroundColor: imperialBlue,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
      home: const MembershipCardScreen(),
    );
  }
}

class MembershipCardScreen extends StatelessWidget {
  const MembershipCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _TopBar(theme: theme),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 560),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: schoolBusYellow,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 18,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _CardHeader(),
                      const SizedBox(height: 28),
                      Center(
                        child: Container(
                          width: 148,
                          height: 148,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            shape: BoxShape.circle,
                            border: Border.all(color: imperialBlue, width: 4),
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 84,
                            color: imperialBlue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'MEMBER NAME',
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Student Organization Member',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      _InfoTile(
                        label: 'Organization',
                        value: 'CPU Student Organization',
                        icon: Icons.groups_2_outlined,
                      ),
                      const SizedBox(height: 12),
                      _InfoTile(
                        label: 'ID Number',
                        value: '2026-0001',
                        icon: Icons.badge_outlined,
                      ),
                      const SizedBox(height: 12),
                      _InfoTile(
                        label: 'Membership Status',
                        value: 'Active',
                        icon: Icons.verified_outlined,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.public),
                          label: const Text('Open Organization Page'),
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

class _TopBar extends StatelessWidget {
  const _TopBar({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Club Membership Card',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const Icon(Icons.card_membership, color: steelAzure),
      ],
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'CPU',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Student Affairs Office',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 22,
          backgroundColor: imperialBlue,
          child: Icon(Icons.school, color: schoolBusYellow),
        ),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: imperialBlue.withOpacity(0.18)),
      ),
      child: Row(
        children: [
          Icon(icon, color: imperialBlue, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
