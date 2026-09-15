import 'package:flutter/material.dart';

// void main() {
//   runApp(const WasteLessApp());
// }

class WasteLessApp extends StatelessWidget {
  const WasteLessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  // Colors sampled from the design.
  static const background = Color(0xFF31572C);
  static const shapeGreen = Color(0xFF35653C);
  static const shapeGreen2 = Color(0xFF426533);
  static const logoOuter = Color(0xFF40916C);
  static const logoInner = Color(0xFF3C8059);
  static const lime = Color(0xFFECF39E);
  static const white = Color(0xFFFAF9F6);
  static const mutedText = Color(0xFFABB8A6);
  static const buttonBorder = Color(0xFF668161);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // ------------------------------------------------------------
              // Background decoration - top right
              // ------------------------------------------------------------
              Positioned(
                top: 0,
                right: 0,
                width: constraints.maxWidth * 0.615,
                height: constraints.maxHeight * 0.27,
                child: Container(
                  decoration: const BoxDecoration(
                    color: shapeGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                    ),
                  ),
                ),
              ),

              // Top-left circle
              Positioned(
                top: constraints.maxHeight * 0.071,
                left: constraints.maxWidth * 0.077,
                child: Container(
                  width: constraints.maxWidth * 0.205,
                  height: constraints.maxWidth * 0.205,
                  decoration: const BoxDecoration(
                    color: shapeGreen2,
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // ------------------------------------------------------------
              // Background decoration - bottom left
              // ------------------------------------------------------------
              Positioned(
                left: 0,
                bottom: 0,
                width: constraints.maxWidth * 0.515,
                height: constraints.maxHeight * 0.235,
                child: Container(
                  decoration: const BoxDecoration(
                    color: shapeGreen2,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                    ),
                  ),
                ),
              ),

              // ------------------------------------------------------------
              // Main content
              // ------------------------------------------------------------
              SafeArea(
                child: Column(
                  children: [
                    const Spacer(flex: 30),

                    // Logo
                    const LeafLogo(),

                    const Spacer(flex: 13),

                    // Title
                    const Text(
                      'WasteLess',
                      style: TextStyle(
                        color: white,
                        fontSize: 76,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -2.5,
                        height: 1,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Subtitle
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'Mai puțină risipă. Mai multă valoare.\n'
                        'Mai bine pentru comunitatea ta.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: mutedText,
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          height: 1.55,
                        ),
                      ),
                    ),

                    const Spacer(flex: 27),

                    // Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: Column(
                        children: [
                          _PrimaryButton(
                            text: 'Începe acum',
                            onPressed: () {},
                          ),

                          const SizedBox(height: 24),

                          _SecondaryButton(
                            text: 'Autentifică-te',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),

                    const Spacer(flex: 26),

                    // Terms
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Continuând, ești de acord cu Termenii & Politica de Confidențialitate',
                          maxLines: 1,
                          style: TextStyle(
                            color: Color(0xFF8FA18B),
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ============================================================================
// LOGO
// ============================================================================

class LeafLogo extends StatelessWidget {
  const LeafLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 192,
      height: 192,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer green circle
          Container(
            width: 192,
            height: 192,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF40916C),
            ),
          ),

          // Inner circle
          Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF3C8059),
            ),
          ),

          // Leaf
          CustomPaint(
            size: const Size(90, 120),
            painter: LeafPainter(),
          ),
        ],
      ),
    );
  }
}

class LeafPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final leafPaint = Paint()
      ..color = const Color(0xFFECF39E)
      ..style = PaintingStyle.fill;

    final stemPaint = Paint()
      ..color = const Color(0xFF68A87C)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final whiteStemPaint = Paint()
      ..color = const Color(0xFFFAF9F6)
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    // Leaf shape
    final leaf = Path();

    leaf.moveTo(size.width / 2, 4);

    leaf.cubicTo(
      size.width * 0.18,
      size.height * 0.30,
      size.width * 0.08,
      size.height * 0.58,
      size.width / 2,
      size.height * 0.76,
    );

    leaf.cubicTo(
      size.width * 0.92,
      size.height * 0.58,
      size.width * 0.82,
      size.height * 0.30,
      size.width / 2,
      4,
    );

    leaf.close();

    canvas.drawPath(leaf, leafPaint);

    // Main leaf vein
    canvas.drawLine(
      Offset(size.width / 2, size.height * 0.42),
      Offset(size.width / 2, size.height * 0.90),
      stemPaint,
    );

    // Left branch
    canvas.drawLine(
      Offset(size.width / 2, size.height * 0.59),
      Offset(size.width * 0.30, size.height * 0.74),
      stemPaint,
    );

    // Right branch
    canvas.drawLine(
      Offset(size.width / 2, size.height * 0.63),
      Offset(size.width * 0.70, size.height * 0.77),
      stemPaint,
    );

    // White stem extending below leaf
    canvas.drawLine(
      Offset(size.width / 2, size.height * 0.76),
      Offset(size.width / 2, size.height * 0.99),
      whiteStemPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ============================================================================
// BUTTONS
// ============================================================================

class _PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _PrimaryButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 116,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFFECF39E),
          foregroundColor: const Color(0xFF31572C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
        ),
        child: const Text(
          'Începe acum',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _SecondaryButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 116,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFF456741),
          foregroundColor: const Color(0xFFD6DCD2),
          side: const BorderSide(
            color: Color(0xFF668161),
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
        ),
        child: const Text(
          'Autentifică-te',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}