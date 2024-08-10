import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'SecondScreen.dart';
import 'package:toastification/toastification.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController sentenceController = TextEditingController();

  bool isPalindrome(String text) {
    String terbalik = text.replaceAll(' ', '').split('').reversed.join('');
    String Asli = text.replaceAll(' ', '');
    print(terbalik);
    print(Asli);

    return Asli.toLowerCase() == terbalik.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1920,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4CA1AF), Color(0xFFC4E0E5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("asset/image11.png"),
            ),
            const Gap(20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Full Name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const Gap(20),
            TextField(
              controller: sentenceController,
              decoration: InputDecoration(
                hintText: 'Your Sentence',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const Gap(20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  bool result = isPalindrome(sentenceController.text);
                  print("Hasil = ${result}");
                  if (result == true) {
                    toastification.show(
                        context: context,
                        type: ToastificationType.success,
                        style: ToastificationStyle.fillColored,
                        autoCloseDuration: const Duration(seconds: 3),
                        title:
                            Text("${sentenceController.text} Is Palindrome"));
                  } else {
                    toastification.show(
                        context: context,
                        type: ToastificationType.error,
                        style: ToastificationStyle.fillColored,
                        autoCloseDuration: const Duration(seconds: 3),
                        title:
                            Text("${sentenceController.text}Isn't Palindrome"));
                  }
                },
                child: const Text('Is Palindrome?')),
            const Gap(20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.indigo,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(
                      name: nameController.text,
                    ),
                  ),
                );
              },
              child: Text('NEXT', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
