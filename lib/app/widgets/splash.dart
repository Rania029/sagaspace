import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    // Membuat controller animasi yang berjalan selama 2 detik
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    
    // Membuat animasi fade in
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.7, curve: Curves.easeIn),
      ),
    );
    
    // Membuat animasi scale up
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.3, 1.0, curve: Curves.easeOutBack),
      ),
    );
    
    // Mulai animasi saat widget diinisialisasi
    _animationController.forward();
    
    // Opsional: Navigasi ke halaman berikutnya setelah splash screen selesai
    /*
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigasi ke halaman berikutnya setelah delay
        Future.delayed(const Duration(milliseconds: 500), () {
          // Ganti dengan kode navigasi sesuai kebutuhan
          // Contoh menggunakan Navigator:
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(builder: (context) => HomePage()),
          // );
          
          // Contoh jika menggunakan GetX:
          // Get.off(() => HomePage());
        });
      }
    });
    */
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff4B2C91),
        body: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 300,
                    height: 300,
                    child: Image.asset("assets/logo/logo-fix.png"),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}