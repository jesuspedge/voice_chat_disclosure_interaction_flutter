import 'package:flutter/material.dart';
import 'package:voice_chat_disclosure_interaction/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4FACFE),
              Color(0xFF00F2FE),
              Color(0xFF38F9D7),
            ],
          ),
        ),
        child: const SafeArea(
          child: Center(
            child: VoiceChat(),
          ),
        ),
      ),
    );
  }
}
