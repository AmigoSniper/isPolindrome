import 'package:flutter/material.dart';
import 'ThirdScreen.dart' as third;

class SecondScreen extends StatefulWidget {
  final String name;
  const SecondScreen({super.key, required this.name});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? selectedUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.blueGrey,
              height: 1.0,
            )),
        title: const Text(
          'Second Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 6),
            Text(widget.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Container(
              width: 640,
              height: 360,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(selectedUser ?? 'None',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    final name = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => third.ThirdScreen(),
                      ),
                    );

                    setState(() {
                      selectedUser = name;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal),
                  child: const Text("Choose a User")),
            )
          ],
        ),
      ),
    );
  }
}
