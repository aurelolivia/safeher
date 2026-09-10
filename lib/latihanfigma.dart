import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Arimo',
        ),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              // HEADER
              Container(
                height: 186,
                width: double.infinity,
                color: const Color(0xFFD9D9D9),
                child: const Center(
                  child: Text(
                    'PPKD',
                    style: TextStyle(
                      fontFamily: 'Arimo',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 28),

                    const Text(
                      'Login Account',
                      style: TextStyle(
                        fontFamily: 'Arimo',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      'Hello, you must login first to be able\n'
                      'to use the application and enjoy all\n'
                      'the features in Calashop',
                      style: TextStyle(
                        fontFamily: 'Arimo',
                        fontSize: 14,
                        color: Color(0xFF888888),
                      ),
                    ),

                    const SizedBox(height: 28),

                    const Text(
                      'Email Address',
                      style: TextStyle(
                        fontFamily: 'Arimo',
                        fontSize: 12,
                        color: Color(0xFF888888),
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextField(
                      decoration: InputDecoration(
                        hintText: 'aurelolivia@gmail                                                 .com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Password',
                      style: TextStyle(
                        fontFamily: 'Arimo',
                        fontSize: 12,
                        color: Color(0xFF888888),
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextField(
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        hintText: '••••••••••••',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontFamily: 'Arimo',
                            color: Color(0xFFEA9459),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffF8623A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontFamily: 'Arimo',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Center(
                      child: Text(
                        'Or Sign In With',
                        style: TextStyle(
                          fontFamily: 'Arimo',
                          color: Color(0xFF888888),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/icons/btnSigninwithGoogle.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Google',
                                  style: TextStyle(
                                    fontFamily: 'Arimo',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/icons/btnSigninwithFb.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Facebook',
                                  style: TextStyle(
                                    fontFamily: 'Arimo',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
   
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontFamily: 'Arimo',
                            color: Color(0xFF888888),
                          ),
                          children: [
                            TextSpan(
                              text: 'Join Us',
                              style: TextStyle(
                                fontFamily: 'Arimo',
                                color: Color(0xFFEA9459),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}