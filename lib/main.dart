import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SpotlightEffect(),
      ),
    );
  }
}

class SpotlightEffect extends StatefulWidget {
  @override
  _SpotlightEffectState createState() => _SpotlightEffectState();
}

class _SpotlightEffectState extends State<SpotlightEffect> {
  Offset _spotlightPosition = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (details) {
        setState(() {
          _spotlightPosition = details.localPosition;
        });
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '''
    Hello! My name is Parth Vora, and I am a skilled software engineer and Flutter developer with a passion for creating innovative and efficient mobile applications. With expertise in building dynamic and user-friendly solutions, I specialize in leveraging the power of Flutter to craft seamless cross-platform experiences.

I thrive on solving complex challenges, whether it’s designing responsive UIs, optimizing app performance, or implementing cutting-edge features. My approach to development focuses on clean, maintainable code and delivering products that align with user needs and expectations.

As a tech enthusiast, I enjoy exploring the latest tools and technologies in the ever-evolving world of software development. I am committed to continuous learning and always look forward to contributing to impactful projects.

I excel at designing pixel-perfect, responsive UIs that captivate users while maintaining accessibility and ease of use. My designs seamlessly adapt to different screen sizes and platforms, providing a consistent user experience.

Utilizing Flutter's robust capabilities, I develop apps that run efficiently on both iOS and Android, reducing development time and costs while maintaining native performance, Proficient in using advanced state management techniques, including Provider, Riverpod, and Bloc, to ensure smooth app functionality and scalable code architecture.
                  ''',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ShaderMask(
              shaderCallback: (rect) {
                return RadialGradient(
                  center: Alignment(
                    (_spotlightPosition.dx - rect.width / 2) / (rect.width / 2),
                    (_spotlightPosition.dy - rect.height / 2) /
                        (rect.height / 2),
                  ),
                  radius: 0.25,
                  colors: const [
                    Colors.black,
                    Colors.transparent,
                  ],
                ).createShader(rect);
              },
              blendMode: BlendMode.dstOut,
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
