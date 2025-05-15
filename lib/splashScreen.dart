import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:assement_deepthi/MainScaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _fadeIn = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = screenWidth > 800;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: isWeb ? _buildWebLayout() : _buildMobileLayout(),
      ),
    );
  }

  Widget _buildWebLayout() {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/pngtree-burger-fire-food-hd-background-image_1541161.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(color: Colors.black.withOpacity(0.6)),
              ),
              Positioned.fill(
                child: FadeTransition(
                  opacity: _fadeIn,
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Lottie.asset(
                          'assets/lottie/Animation - 1747318515824.json',
                          height: 150,
                        ),
                        const SizedBox(height: 20),
                        _buildLogo(40),
                        const SizedBox(height: 40),
                        const Text(
                          'Welcome to mbadok.\nYour favourite foods delivered fast at your door.',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: FadeTransition(
                opacity: _fadeIn,
                child: _buildLoginContent(true),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/pngtree-burger-fire-food-hd-background-image_1541161.jpg',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: Container(color: Colors.black.withOpacity(0.6)),
              ),
              Positioned.fill(
                child: FadeTransition(
                  opacity: _fadeIn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      Lottie.asset(
                        'assets/lottie/Animation - 1747318515824.json',
                        height: 120,
                      ),
                      const SizedBox(height: 20),
                      _buildLogo(32),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Welcome to mbadok.\nYour favourite foods delivered fast at your door.',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20),
            child: FadeTransition(
              opacity: _fadeIn,
              child: _buildLoginContent(false),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(double size) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('m',
            style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.bold,
                color: Colors.orange)),
        Text('bad',
            style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        Text('ok',
            style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.bold,
                color: Colors.green)),
      ],
    );
  }

  Widget _buildLoginContent(bool isWeb) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MainScaffold()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: const Text(
            'Get Started',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 30),
        const Text('Or sign in with', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(FontAwesomeIcons.facebook, color: Colors.blue, size: 28),
            SizedBox(width: 20),
            Icon(FontAwesomeIcons.google, color: Colors.red, size: 28),
            SizedBox(width: 20),
            Icon(FontAwesomeIcons.apple, color: Colors.white, size: 28),
          ],
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () {
          },
          child: const Text.rich(
            TextSpan(
              text: "Don’t have an account? ",
              style: TextStyle(color: Colors.grey),
              children: [
                TextSpan(
                  text: "Sign Up",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
