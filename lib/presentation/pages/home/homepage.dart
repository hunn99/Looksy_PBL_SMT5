import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:looksy/presentation/utils/theme.dart';
import 'package:looksy/presentation/widgets/button/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
    _getUsername();
    _loadUsername();
  }

  Future<void> _checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token == null) {
      // Jika token tidak ada, arahkan ke halaman login
      context.go('/login');
    }
  }

  Future<void> _getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString('username');
    if (storedUsername != null) {
      setState(() {
        username = storedUsername;
      });
    } else {
      // If username is not found, redirect to login
      context.go('/login');
    }
  }

  // Ambil username dari SharedPreferences dan ubah huruf pertama menjadi kapital
  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString('username') ?? 'user'; // Default 'user' jika tidak ada
    setState(() {
      // Ubah huruf pertama menjadi kapital
      username = _capitalizeFirstLetter(storedUsername);
    });
  }

  // Fungsi untuk mengubah huruf pertama menjadi kapital
  String _capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.maxFinite,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
                color: neutralTheme,
                height: double.infinity,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/Logo_white.png', height: 34),
                    const SizedBox(height: 16),
                    Text(
                      'Hi, $username 👋',
                      style: TextStyle(
                          fontSize: 28,
                          letterSpacing: -1,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Find Your Perfect Look in a Snap!',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  height: height * 0.62,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: 112,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: neutralTheme[100]!),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: double.infinity,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://lh5.googleusercontent.com/p/AF1QipMM4gOpnqmBkrFlMo11kk4tCFi_4DVq6nVJ6h9B=w114-h114-n-k-no',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    'Berkah Barbershop',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: neutralTheme,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Jl. Danau Toba No.6, Malang',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: neutralTheme[300],
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Schedule Your Shave',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: neutralTheme),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: neutralTheme[100]!),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: neutralTheme[100]!),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(IconsaxBold.calendar),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Choose a Date',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: neutralTheme[300]),
                                      ),
                                    ],
                                  ),
                                  const Icon(IconsaxOutline.arrow_down_1)
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: neutralTheme[100]!),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(IconsaxBold.clock),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Choose a Time',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: neutralTheme[300]),
                                      ),
                                    ],
                                  ),
                                  const Icon(IconsaxOutline.arrow_down_1)
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: neutralTheme[100]!),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(IconsaxBold.scissor),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Choose a Service',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: neutralTheme[300]),
                                      ),
                                    ],
                                  ),
                                  const Icon(IconsaxOutline.arrow_down_1)
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Button(
                              label: 'Book Now',
                              onTap: () {
                                context.push('/history');
                              },
                              isDisabled: false,
                              colorBackground: neutralTheme,
                              colorText: Colors.white,
                            ),
                          ],
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
