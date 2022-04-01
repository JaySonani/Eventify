import 'package:eventify/user_management/User.dart';
import 'package:flutter/material.dart';

class DashBaoard extends StatefulWidget {
  final User user;

  const DashBaoard({Key? key, required this.user}) : super(key: key);

  @override
  State<DashBaoard> createState() => _DashBaoardState();
}

class _DashBaoardState extends State<DashBaoard> {
  var events = [for (var i = 1; i <= 10; i++) "Event Title $i"];
  // ignore: non_constant_identifier_names
  String event_title = "Event Title";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("Welcome, ${widget.user.name}"),
        actions: [Text("Logged in as: ${widget.user.profile}")],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.user.name),
              accountEmail: Text(widget.user.email),
            ),
            // Text(widget.user.name),
            // Text(widget.user.email),
            // Text(widget.user.birthDate),
            // Text(widget.user.profile),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey),
                ),
              ),
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      height: 100,
                      child: Center(
                        child: ListTile(
                          title: Text(events[index]),
                          leading: const Icon(Icons.event_available),
                          onTap: () {
                            setState(() {
                              event_title = events[index];
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event_title,
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Placeholder(
                      fallbackHeight: 200,
                      fallbackWidth: 200,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                        "This is the description of the event. This is the description of the event. This is the description of the event. This is the description of the event. This is the description of the event. This is the description of the event. This is the description of the event. ")
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
