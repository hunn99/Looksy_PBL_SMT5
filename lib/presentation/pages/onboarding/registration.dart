import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:looksy/presentation/utils/theme.dart';
import 'package:looksy/presentation/widgets/button/button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  void _unfocus() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: _unfocus, // Menghilangkan fokus dari TextField saat area luar diketuk
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 64),
                  Image.asset(
                    'assets/images/Logo_black.png',
                    height: 40,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Welcome to Looksy!',
                    style: TextStyle(
                      fontSize: 32,
                      color: Color(0xFF1b1b1b),
                      fontWeight: FontWeight.w500,
                      letterSpacing: -2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Discover your perfect hairstyle tailored to your\n'
                    'unique face shape. Let\'s get started on your style\n'
                    'journey!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFB0B0B0),
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    style: const TextStyle(fontSize: 11),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Color(0xFFD1D1D1), fontSize: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFE7E7E7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFF1b1b1b)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    style: const TextStyle(fontSize: 11),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      hintText: 'Username',
                      hintStyle: const TextStyle(color: Color(0xFFD1D1D1), fontSize: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFE7E7E7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFF1b1b1b)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    style: const TextStyle(fontSize: 11),
                    focusNode: _passwordFocusNode,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Color(0xFFD1D1D1), fontSize: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFE7E7E7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFF1b1b1b)),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: _togglePasswordVisibility,
                        child: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    style: const TextStyle(fontSize: 11),
                    focusNode: _confirmPasswordFocusNode,
                    obscureText: !_isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(color: Color(0xFFD1D1D1), fontSize: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFE7E7E7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFF1b1b1b)),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: _toggleConfirmPasswordVisibility,
                        child: Icon(
                          _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  Button(
                    label: 'Sign up',
                    onTap: () {
                      // Add action for registration
                    },
                    isDisabled: false,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    textSize: 16,
                    colorText: Colors.white,
                    colorBackground: Color(0xFF1b1b1b),
                  ),
                  const SizedBox(height: 12),
                  Button(
                    label: 'Sign up with Google',
                    onTap: () {
                      // Add action for Google sign up
                    },
                    isDisabled: false,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    textSize: 16,
                    colorText: Color(0xFF1b1b1b),
                    colorBackground: Colors.white,
                    borderColor: Color(0xFF1b1b1b),
                    icon: Container(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        'assets/images/google.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1b1b1b),
                          ), // Ukuran font diubah menjadi 11
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push('/login');
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16, // Ukuran font diubah menjadi 11
                            color: Color(0xFF1b1b1b),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
