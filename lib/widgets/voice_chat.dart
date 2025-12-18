import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voice_chat_disclosure_interaction/users.dart';
import 'package:voice_chat_disclosure_interaction/widgets/widgets.dart';

class VoiceChat extends StatefulWidget {
  const VoiceChat({super.key});

  @override
  State<VoiceChat> createState() => _VoiceChatState();
}

class _VoiceChatState extends State<VoiceChat>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool isOpen = false;
  final animationDuration = const Duration(milliseconds: 200);

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    )..addListener(() => setState(() {}));

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          duration: animationDuration,
          height: isOpen ? 340 : 60,
          width: isOpen ? 300 : 210,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(250),
            border: Border.all(color: Colors.black12),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                /// Title
                AnimatedContainer(
                  height: isOpen ? 40 : 0,
                  duration: animationDuration,
                  child: AnimatedOpacity(
                    opacity: animation.value,
                    duration: animationDuration,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xFFE8F3FA),
                        border:
                            Border(bottom: BorderSide(color: Colors.black12)),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            'Voice Chat',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.black54),
                          ),
                          GestureDetector(
                            onTap: () {
                              unawaited(animationController.reverse());
                              setState(() => isOpen = false);
                            },
                            child: const Icon(
                              Icons.close_rounded,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// Users container
                AnimatedContainer(
                  height: isOpen ? 200 : 60,
                  duration: animationDuration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedContainer(
                        duration: animationDuration,
                        width: isOpen ? 290 : 145,
                        padding: const EdgeInsets.all(5),
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          clipBehavior: Clip.none,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 10,
                          crossAxisCount: 4,
                          childAspectRatio:
                              lerpDouble(1, 0.75, animation.value) ?? 0.75,
                          children: List.generate(users.length, (index) {
                            return isOpen
                                ? Stack(
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        top: 0,
                                        child: SizedBox.square(
                                          dimension: lerpDouble(
                                                50,
                                                65,
                                                animation.value,
                                              ) ??
                                              65,
                                          child: CircularAvatar(
                                            imagePath: users[index].avatarAsset,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: isOpen
                                            ? AnimatedOpacity(
                                                duration: animationDuration,
                                                opacity: animation.value,
                                                child: Text(
                                                  users[index].name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                        color: Colors.black54,
                                                      ),
                                                ),
                                              )
                                            : const SizedBox.shrink(),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Visibility(
                                          visible: users[index].isSpeaking,
                                          child: SizedBox.square(
                                            dimension: isOpen ? 20 : 0,
                                            child: AnimatedOpacity(
                                              duration: animationDuration,
                                              opacity: animation.value,
                                              child: const SpeakCircle(
                                                animationColor: Colors.black45,
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : (index <= 3)
                                    ? GestureDetector(
                                        onTap: () {
                                          unawaited(
                                            animationController.forward(),
                                          );
                                          setState(() => isOpen = true);
                                        },
                                        child: Stack(
                                          alignment: Alignment.center,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              top: 0,
                                              child: SizedBox.square(
                                                dimension: 50,
                                                child: CircularAvatar(
                                                  imagePath:
                                                      users[index].avatarAsset,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : const SizedBox.shrink();
                          }),
                        ),
                      ),
                      AnimatedContainer(
                        duration: animationDuration,
                        width: isOpen ? 0 : 50,
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: GestureDetector(
                            onTap: () {
                              unawaited(animationController.forward());
                              setState(() => isOpen = true);
                            },
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Text(
                                  '+${users.length - 4}',
                                  style: const TextStyle(color: Colors.black45),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Button Container
                AnimatedOpacity(
                  opacity: animation.value,
                  duration: animationDuration,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black54, Colors.black],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      'Join Now',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                /// Text
                AnimatedOpacity(
                  opacity: animation.value,
                  duration: animationDuration,
                  child: Text(
                    'Mic will be mutted initially.',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        ),

        /// Speak circle icon
        Positioned(
          top: -10,
          left: -10,
          child: AnimatedOpacity(
            opacity: 1 - animation.value,
            duration: animationDuration,
            child: const SpeakCircle(
              animationColor: Colors.white,
              backgroundColor: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
