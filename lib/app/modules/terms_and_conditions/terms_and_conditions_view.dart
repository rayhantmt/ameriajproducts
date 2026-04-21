import 'package:flutter/material.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Terms and Conditions',
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
                  'Effective Date: [Insert Date]\n\nBy using The Readiness Track, you agree to the following terms:'),
              _buildSectionTitle('1. Purpose of the App'),
              _buildParagraph(
                  'The app is intended to assist users in tracking readiness metrics. It is not an official military system of record.'),
              _buildSectionTitle('2. User Responsibilities'),
              _buildParagraph('You agree to:'),
              _buildBullet('Provide accurate information'),
              _buildBullet('Keep your login credentials secure'),
              _buildBullet(
                  'Use the app in compliance with applicable laws and military policies'),
              _buildSectionTitle('3. No Official Military Authority'),
              _buildParagraph(
                  'The Readiness Track is not affiliated with or endorsed by the U.S. Department of Defense unless explicitly stated.'),
              _buildSectionTitle('4. No Medical or Professional Advice'),
              _buildParagraph(
                  'The app does not provide medical, fitness, or tactical advice. Users should consult qualified professionals.'),
              _buildSectionTitle('5. Data Accuracy'),
              _buildParagraph(
                  'We do not guarantee the accuracy or completeness of readiness data.'),
              _buildSectionTitle('6. Limitation of Liability'),
              _buildParagraph('We are not liable for:'),
              _buildBullet('Decisions made based on app data'),
              _buildBullet('Data loss or inaccuracies'),
              _buildBullet('Service interruptions'),
              _buildSectionTitle('7. Termination'),
              _buildParagraph(
                  'We may suspend or terminate access for violations of these terms.'),
              _buildSectionTitle('8. Changes to Terms'),
              _buildParagraph('We may update these terms at any time.'),
              _buildSectionTitle('9. Governing Law'),
              _buildParagraph(
                  'These terms are governed by the laws of the United States.'),
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