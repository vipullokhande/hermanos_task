import 'package:flutter/material.dart';
import 'package:hermanos/screens/authentication/sign_up_screen.dart';
import 'package:hermanos/screens/home_screen.dart';
import 'package:hermanos/services/authentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  bool isLoading = false;
  final usernameeController = TextEditingController();
  final passworddController = TextEditingController();
  final key = GlobalKey<FormState>();
  //
  @override
  Widget build(BuildContext context) {
    //
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.circular(10),
    );
    //
    var btnSize = Size(MediaQuery.of(context).size.width * 0.8, 50);
    //
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              scrollDirection: Axis.vertical,
              child: Form(
                key: key,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Check username';
                        }
                        return null;
                      },
                      autofocus: false,
                      controller: usernameeController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: inputBorder,
                        hintText: 'Username',
                        label: const Text('Username'),
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: inputBorder,
                        enabledBorder: inputBorder,
                        contentPadding: const EdgeInsets.all(8.0),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'must be at least 6 characters';
                        }
                        return null;
                      },
                      autofocus: false,
                      controller: passworddController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: inputBorder,
                        hintText: 'Password',
                        label: const Text('Password'),
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        focusedBorder: inputBorder,
                        enabledBorder: inputBorder,
                        contentPadding: const EdgeInsets.all(8.0),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: btnSize,
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        if (key.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          dynamic data = await Authentication().loginUser(
                            username: usernameeController.text,
                            password: passworddController.text,
                          );
                          // ignore: avoid_print
                          print(data);
                          if (data != 'error') {
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(
                                  isGuest: false,
                                  id: 1,
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont have an account? ',
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Create',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          fixedSize: btnSize,
                          backgroundColor: Colors.black87,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(
                                isGuest: true,
                                id: -1,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Guest Mode',
                          style: TextStyle(fontSize: 15),
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
