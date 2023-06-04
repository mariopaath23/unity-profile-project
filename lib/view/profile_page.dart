import 'package:flutter/material.dart';

import '../theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/Gradient-Background-Wallpaper-002.jpg',
                ),
                fit: BoxFit.cover),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/Me.jpeg'),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Mario Paath',
                style: titleTextStyle.copyWith(
                    letterSpacing: 2,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Not Senior Flutter Developer',
                style: titleTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('apa itu flutter?')
            ],
          ),
        )
      ],
    );
  }
}
