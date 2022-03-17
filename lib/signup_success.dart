import 'dart:convert';

import 'package:eventify/homepage.dart';
import 'package:eventify/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

class SignUpSucess extends StatefulWidget {
  final Map<String, String> verificationData;

  const SignUpSucess({Key? key, required this.verificationData})
      : super(key: key);

  @override
  State<SignUpSucess> createState() => _SignUpSucessState();
}

class _SignUpSucessState extends State<SignUpSucess> {
  bool loading = true;

  String titleText = "Please wait";
  String messageText = "";

  @override
  void initState() {
    verifyEmail();
    super.initState();
  }

  void verifyEmail() async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://eventify-env-flask.eba-cvewnpwp.us-east-1.elasticbeanstalk.com/confirmsignup'));
    request.body = json.encode(widget.verificationData);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
      setState(() {
        titleText = "Email verified successfully.";
        messageText = "You can now login with registered email and password";
      });
    } else if (response.statusCode == 201) {
      setState(() {
        titleText = "User already exists.";
        messageText =
            "A user already found with email\n${widget.verificationData['username']}";
      });
    } else if (response.statusCode == 202) {
      setState(() {
        titleText = "Email verification failed";
        messageText =
            "The code you entered does not match with one that has been sent to:\n${widget.verificationData['username']}";
      });
    }
    debugPrint(response.reasonPhrase);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Eventify Application"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150),
          child: Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            // color: Colors.red,
            width: 500,
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  titleText,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                loading
                    ? const Center(child: CircularProgressIndicator())
                    : Text(
                        messageText,
                      ),
                !loading
                    ? Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              // width: double.infinity,
                              height: 40,
                              child: OutlinedButton(
                                onPressed: (() {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const SignUpPage(),
                                    ),
                                  );

                                  // push LoginPage replaced route
                                }),
                                child: const Text("Sign Up"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                              // width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: (() {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const HomePage(),
                                    ),
                                  );

                                  // push LoginPage replaced route
                                }),
                                child: const Text("Login"),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
