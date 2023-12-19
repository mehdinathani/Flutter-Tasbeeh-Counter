// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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

  int zikrCounter = 0;
  int zikrSize = 34;
  String zikrImageUrl = "assets/images/0.jpg";
  counternum() {
    setState(() {
      if (counter < 100) {
        counter++;
        zikrCounter++;
        if (counter == 35 || counter == 68 || counter == 0) {
          zikrCounter = 1;
        } else {
          // zikrCounter++;
        }
      } else {
        counter = 0;
        zikrCounter = 0;
      }
      displayZikar();
    });
  }

  resetCounter() {
    setState(() {
      counter = 0;
      resetZikrCounter();
    });
    displayZikar();
  }

  resetZikrCounter() {
    setState(() {
      zikrCounter = 0;
    });
  }

  Zikar currentZikar = Zikar.Bismillah;
  displayZikar() {
    setState(() {
      if (counter > 34 && counter < 68) {
        zikrImageUrl = "assets/images/2.avif";

        currentZikar = Zikar.Alhamdulillah;
        zikrSize = 33;
      } else if (counter > 67) {
        zikrImageUrl = "assets/images/3.avif";
        currentZikar = Zikar.SubhanAllah;
        zikrSize = 33;
      } else if (counter > 0) {
        zikrImageUrl = "assets/images/1.avif";
        currentZikar = Zikar.AllahHuAkbar;
        zikrSize = 34;
      } else {
        zikrImageUrl = "assets/images/0.jpg";
        currentZikar = Zikar.Bismillah;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        centerTitle: true,
        title: const Text(
          "Tasbeeh Counter",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            counternum();
            debugPrint("Counter $counter");
            debugPrint("Zikr Counter $zikrCounter");
          },
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/originals/b3/9f/a7/b39fa7a6255973e44eb2027a33d78356.jpg"),
                fit: BoxFit.fill,
                opacity: 0.7,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10), // Add space below the widget
                ),
                CircularStepProgressIndicator(
                  totalSteps: zikrSize,
                  currentStep: zikrCounter,
                  stepSize: 15,
                  width: 230,
                  height: 230,
                  roundedCap: (index, _) => true,
                  child: Center(
                    child: CircleAvatar(
                        radius: 90, backgroundImage: AssetImage(zikrImageUrl)
                        //NetworkImage(zikrImageUrl),
                        ),
                  ),
                ),
                const Expanded(child: SizedBox(height: 10)),
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Text(
                    "$zikrCounter",
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                const Text("Click anywhere on the screen"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.7),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Created by: Mehdi Abbas Nathani",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "For Reviews and Suggestions: \n mehdinathani@gmail.com",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text("Copyright © 2023. All rights reserved.",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
