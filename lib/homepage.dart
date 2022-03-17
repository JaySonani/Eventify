import 'dart:convert';

import 'package:eventify/dashboard.dart';
import 'package:eventify/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  void login() async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://eventify-env-flask.eba-cvewnpwp.us-east-1.elasticbeanstalk.com/login'));
    request.body = json.encode({
      "username": emailController.text,
      "password": passwordController.text
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: const DashBaoard(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Login failed. Please check your credentials."),
        ),
      );
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Eventify Application"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Eventify",
                    style: TextStyle(fontSize: 50),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 400,
                    child: Wrap(
                      children: const [
                        Text(
                          "End of your search to find events around you.",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                // color: Colors.red,
                width: 500,
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Login here",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    loading
                        ? const CircularProgressIndicator()
                        : Column(
                            children: [
                              TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  label: Text("Enter email address"),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    label: Text("Enter your password")),
                              ),
                            ],
                          ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: (() {
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("All fields are required"),
                              ),
                            );
                          } else {
                            setState(() {
                              loading = true;
                            });
                            login();
                          }
                        }),
                        child: const Text("Login"),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: const SignUpPage(),
                            ),
                          ),
                          child: const Text("New user?"),
                        ),
                        TextButton(
                          onPressed: () => {},
                          child: const Text("Forget password?"),
                        ),
                      ],
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
