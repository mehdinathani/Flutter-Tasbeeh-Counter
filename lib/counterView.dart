// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

//Enum
enum Zikar {
  Bismillah,
  AllahHuAkbar,
  Alhamdulillah,
  SubhanAllah,
  Salwat,
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 0;
  counternum() {
    setState(() {
      if (counter < 100) {
        counter++;
      } else {
        counter = 0;
      }
      displayZikar();
    });
  }

  resetCounter() {
    setState(() {
      counter = 0;
    });
    displayZikar();
  }

  Zikar currentZikar = Zikar.Bismillah;
  displayZikar() {
    setState(() {
      if (counter > 34 && counter < 68) {
        currentZikar = Zikar.Alhamdulillah;
      } else if (counter > 67) {
        currentZikar = Zikar.SubhanAllah;
      } else if (counter > 0) {
        currentZikar = Zikar.AllahHuAkbar;
      } else {
        currentZikar = Zikar.Bismillah;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Tasbeeh Counter",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(30), // Add space below the widget
            ),
            Expanded(
              child: Image.network(
                  "https://i.pinimg.com/originals/b3/9f/a7/b39fa7a6255973e44eb2027a33d78356.jpg"),
            ),
            // Container(
            //   color: Colors.transparent,
            //   padding: const EdgeInsets.all(8),
            //   margin: const EdgeInsets.all(8),
            //   child: Text(
            //     currentZikar.toString().split(".").last,
            //     style: const TextStyle(fontSize: 40),
            //   ),
            // ),
            Text(
              "$counter",
              style: const TextStyle(
                fontSize: 50,
                color: Colors.black,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: counternum,
                  icon: const Icon(
                    Icons.book_rounded,
                    size: 30,
                  ),
                  label: Text(
                    currentZikar.toString().split(".").last,
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                    onPressed: resetCounter,
                    icon: const Icon(
                      Icons.restore,
                      size: 40,
                    ),
                    label: const Text(
                      "Reset",
                      style: TextStyle(fontSize: 30),
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: Colors.green,
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text("Created by: Mehdi Abbas Nathani"),
                  Text("For Reviews and Suggestions: mehdinathani@gmail.com"),
                  Text("Copyright © 2023 TermsFeed®. All rights reserved."),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
