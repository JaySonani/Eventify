import 'package:flutter/material.dart';

class DashBaoard extends StatefulWidget {
  const DashBaoard({Key? key}) : super(key: key);

  @override
  State<DashBaoard> createState() => _DashBaoardState();
}

class _DashBaoardState extends State<DashBaoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Eventify Application"),
      ),
      backgroundColor: Colors.white,
      body:
          const Center(child: Text("Log in successful. Welcome to Dashboard!")),
    );
  }
}
