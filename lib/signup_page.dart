import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int radioValue = -1;

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
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Register here",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SizedBox(
                          width: 210,
                          child: TextField(
                            decoration: InputDecoration(hintText: "First name"),
                          ),
                        ),
                        SizedBox(
                          width: 210,
                          child: TextField(
                            decoration: InputDecoration(hintText: "Last name"),
                          ),
                        ),
                      ],
                    ),
                    const TextField(
                      decoration:
                          InputDecoration(hintText: "Enter email address"),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          hintText: "Enter date of birth(dd/mm/yyyy)"),
                    ),
                    const TextField(
                      decoration:
                          InputDecoration(hintText: "Create your password"),
                    ),
                    SizedBox(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Select Role:"),
                          Radio(
                            value: 1,
                            groupValue: radioValue,
                            onChanged: (value) {
                              setState(() {
                                radioValue = int.parse(value.toString());
                              });
                            },
                          ),
                          const Text("Normal registration"),
                          const SizedBox(
                            width: 20,
                          ),
                          Radio(
                            value: 2,
                            groupValue: radioValue,
                            onChanged: (value) {
                              setState(() {
                                radioValue = int.parse(value.toString());
                              });
                            },
                          ),
                          const Text("Event Organizer"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: (() {}),
                        child: const Text("Register"),
                      ),
                    ),
                    TextButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text("Back to Login"),
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
