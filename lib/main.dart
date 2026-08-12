import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

const Color imperialBlue = Color(0xFF00296B);
const Color frenchBlue = Color(0xFF003F88);
const Color steelAzure = Color(0xFF00509D);
const Color schoolBusYellow = Color(0xFFFDC500);
const Color gold = Color(0xFFFFD500);
const Color deepNavy = Color(0xFF0A2540);

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
          onPrimary: deepNavy,
          onSecondary: deepNavy,
          onSurface: deepNavy,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF8F9FA),
          foregroundColor: deepNavy,
        ),
      ),
      home: const MembershipCardScreen(),
    );
  }
}

class MembershipCardScreen extends StatelessWidget {
  const MembershipCardScreen({super.key});

  Future<void> _openOrganizationPage() async {
    final uri = Uri.parse('https://cpu.edu.ph/');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }

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
                    border: Border.all(color: deepNavy.withOpacity(0.2)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: deepNavy.withOpacity(0.14)),
                        ),
                        child: const _CardHeader(),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Container(
                          width: 154,
                          height: 154,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: deepNavy, width: 4),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 12,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(4),
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://raw.githubusercontent.com/swcidd/Sanol_SherwinSid_Lab5/main/assets/sherwin_profile.jpg',
                              fit: BoxFit.cover,
                              width: 146,
                              height: 146,
                              placeholder: (context, url) => Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    color: deepNavy,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/sherwin_profile.jpg',
                                fit: BoxFit.cover,
                                width: 146,
                                height: 146,
                              ),
                            ),
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
                                color: deepNavy,
                                letterSpacing: 1.1,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Student Organization Member',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: deepNavy.withOpacity(0.9),
                                fontWeight: FontWeight.w600,
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
                        value: '25-1990-32',
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
                        child: OutlinedButton.icon(
                          onPressed: _openOrganizationPage,
                          icon: const Icon(Icons.public),
                          label: const Text('Open Organization Page'),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: deepNavy,
                            side: const BorderSide(color: deepNavy, width: 2.2),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                            elevation: 3,
                            shadowColor: Colors.black26,
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
            color: deepNavy,
          ),
        ),
        const Icon(Icons.card_membership, color: deepNavy),
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
                color: deepNavy,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Student Affairs Office',
              style: TextStyle(
                color: deepNavy,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 22,
          backgroundColor: schoolBusYellow,
          child: Icon(Icons.school, color: deepNavy),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: deepNavy.withOpacity(0.14)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: schoolBusYellow.withOpacity(0.25),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: deepNavy, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: deepNavy.withOpacity(0.82),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: deepNavy,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
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
