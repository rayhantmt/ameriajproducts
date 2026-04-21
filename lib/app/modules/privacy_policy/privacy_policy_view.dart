import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xff2A2A2A),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              _buildParagraph(
                  'Effective Date: [Insert Date]\n\nThe Readiness Track ("we," "our," or "us") respects your privacy and is committed to protecting it. This Privacy Policy explains how we collect, use, and safeguard your information when you use our mobile application.'),
              _buildSectionTitle('1. Information We Collect'),
              _buildSubtitle('a. Personal Information'),
              _buildBullet('Name'),
              _buildBullet('Email address'),
              _buildBullet('Military status or unit information (if provided)'),
              _buildSubtitle('b. Readiness Data'),
              _buildBullet('Medical readiness status'),
              _buildBullet('Weapons qualification status'),
              _buildBullet('Physical fitness data'),
              _buildBullet('Training and combat readiness metrics'),
              _buildSubtitle('c. Device Information'),
              _buildBullet('Device type and operating system'),
              _buildBullet('App usage data'),
              _buildBullet('IP address'),
              _buildSectionTitle('2. How We Use Your Information'),
              _buildParagraph('We use your information to:'),
              _buildBullet('Provide and maintain the app'),
              _buildBullet('Track and display readiness metrics'),
              _buildBullet('Send reminders and notifications'),
              _buildBullet('Improve app performance and features'),
              _buildBullet('Ensure security and prevent misuse'),
              _buildSectionTitle('3. Sharing of Information'),
              _buildParagraph('We do not sell your personal data.\n\nWe may share information:'),
              _buildBullet('With your consent'),
              _buildBullet('With service providers supporting app functionality'),
              _buildBullet('If required by law or military regulation'),
              _buildSectionTitle('4. Data Security'),
              _buildParagraph(
                  'We implement reasonable safeguards to protect your data. However, no system is completely secure.'),
              _buildSectionTitle('5. Data Retention'),
              _buildParagraph(
                  'We retain data only as long as necessary to provide services or comply with legal obligations.'),
              _buildSectionTitle('6. Your Rights'),
              _buildParagraph('You may:'),
              _buildBullet('Request access to your data'),
              _buildBullet('Request correction or deletion'),
              _buildBullet('Withdraw consent where applicable'),
              _buildSectionTitle('7. Children\'s Privacy'),
              _buildParagraph('This app is not intended for users under 18.'),
              _buildSectionTitle('8. Changes to This Policy'),
              _buildParagraph(
                  'We may update this policy. Changes will be reflected with a new effective date.'),
              _buildSectionTitle('9. Contact Us'),
              _buildParagraph('Readinesstrack@gmail.com'),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Color(0xff2A2A2A),
        ),
      ),
    );
  }

  Widget _buildSubtitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
          color: Color(0xff2A2A2A),
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Color(0xff838383),
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Color(0xff838383),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xff838383),
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}