import 'package:flutter/material.dart';
import 'student_details_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    
    final emailRegex = RegExp(r'^[A-Za-z0-9][A-Za-z0-9.]*[A-Za-z0-9]@nsut\.ac\.in$');
    return emailRegex.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    // Password must be at least 8 characters long
    return password.length >= 8;
  }

  void _validateAndLogin() {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    final email = emailController.text.trim();
    final password = passwordController.text;

    bool isValid = true;

    // Validate email
    if (email.isEmpty) {
      setState(() {
        _emailError = 'Email is required';
      });
      isValid = false;
    } else if (!_isValidEmail(email)) {
      setState(() {
        _emailError = 'Email must be in format XXXXXX@nsut.ac.in';
      });
      isValid = false;
    }

    // Validate password
    if (password.isEmpty) {
      setState(() {
        _passwordError = 'Password is required';
      });
      isValid = false;
    } else if (!_isValidPassword(password)) {
      setState(() {
        _passwordError = 'Password must be at least 8 characters long';
      });
      isValid = false;
    }

    // If validation passes, navigate to next page
    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const StudentDetailsPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF002855) : Colors.white;
    final textColor = isDarkMode ? Colors.white : const Color(0xFF002855);
    final borderColor = isDarkMode ? Colors.white54 : const Color(0xFF002855);
    final focusedBorderColor = isDarkMode ? Colors.white : const Color(0xFF002855);
    final buttonBackgroundColor = isDarkMode ? Colors.white : const Color(0xFF002855);
    final buttonTextColor = isDarkMode ? const Color(0xFF002855) : Colors.white;
    final errorColor = Colors.red;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 60),
                Text(
                  "IEEE EduMate",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 80),
                TextField(
                  controller: emailController,
                  style: TextStyle(color: textColor),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: textColor),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _emailError != null ? errorColor : borderColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _emailError != null ? errorColor : focusedBorderColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: errorColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: errorColor, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                if (_emailError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _emailError!,
                        style: TextStyle(
                          color: errorColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  style: TextStyle(color: textColor),
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: textColor),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _passwordError != null ? errorColor : borderColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _passwordError != null ? errorColor : focusedBorderColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: errorColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: errorColor, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility : Icons.visibility_off,
                        color: textColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                if (_passwordError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _passwordError!,
                        style: TextStyle(
                          color: errorColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonBackgroundColor,
                    foregroundColor: buttonTextColor,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Login", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  onPressed: _validateAndLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


