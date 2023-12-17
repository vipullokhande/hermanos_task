import 'package:flutter/material.dart';
import 'package:hermanos/screens/authentication/login_screen.dart';
import 'package:hermanos/screens/home_screen.dart';
import 'package:hermanos/services/authentication.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //
  bool isLoading = false;
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final fullnameController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final numberController = TextEditingController();
  final zipcodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    fullnameController.dispose();
    streetController.dispose();
    cityController.dispose();
    numberController.dispose();
    zipcodeController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                autovalidateMode: AutovalidateMode.always,
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      'Enter Account Details',
                      style: TextStyle(
                        fontSize: 30,
                        wordSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (!value!.contains('@')) {
                          return 'Badly formatted';
                        }
                        return null;
                      },
                      autofocus: false,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: inputBorder,
                        hintText: 'Email',
                        label: const Text('Email'),
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
                        return null;
                      },
                      autofocus: false,
                      controller: usernameController,
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
                          return 'Must be 6 characters';
                        }
                        return null;
                      },
                      autofocus: false,
                      controller: passwordController,
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
                    TextFormField(
                      validator: (value) {
                        return null;
                      },
                      autofocus: false,
                      controller: firstnameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: inputBorder,
                        hintText: 'First name',
                        label: const Text('First name'),
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
                        return null;
                      },
                      autofocus: false,
                      controller: lastnameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: inputBorder,
                        hintText: 'Last name',
                        label: const Text('Last name'),
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
                        return null;
                      },
                      autofocus: false,
                      controller: fullnameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: inputBorder,
                        hintText: 'Full name',
                        label: const Text('Full name'),
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
                        return null;
                      },
                      autofocus: false,
                      controller: streetController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: inputBorder,
                        hintText: 'Street',
                        label: const Text('Street'),
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
                        return null;
                      },
                      autofocus: false,
                      controller: numberController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: inputBorder,
                        hintText: 'Number',
                        label: const Text('Number'),
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
                        if (value!.length < 6 || value.length > 6) {
                          return 'Error';
                        }
                        return null;
                      },
                      autofocus: false,
                      controller: zipcodeController,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      decoration: InputDecoration(
                        border: inputBorder,
                        hintText: 'Zip code',
                        label: const Text('Zip code'),
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
                        return null;
                      },
                      autofocus: false,
                      controller: cityController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: inputBorder,
                        hintText: 'City',
                        label: const Text('City'),
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
                        if (value!.length < 10) {
                          return 'Error';
                        }
                        return null;
                      },
                      autofocus: false,
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: InputDecoration(
                        border: inputBorder,
                        hintText: 'Phone number',
                        label: const Text('Phone number'),
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
                          FocusScope.of(context).unfocus;
                          setState(() async {
                            isLoading = true;
                            dynamic data = await Authentication().createUser(
                              email: emailController.text,
                              username: usernameController.text,
                              firstname: firstnameController.text,
                              lastname: lastnameController.text,
                              password: passwordController.text,
                              city: cityController.text,
                              street: streetController.text,
                              number: numberController.text,
                              zipcode: zipcodeController.text,
                              lat: '-37.3159',
                              long: '81.1496',
                              phonenumber: 1234567890,
                            );
                            isLoading = false;
                            // ignore: avoid_print
                            print(data);
                            if (data != 'error') {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(
                                    isGuest: false,
                                    id: 2,
                                  ),
                                ),
                              );
                            }
                          });
                        }
                      },
                      child: const Text('Create'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Login',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
