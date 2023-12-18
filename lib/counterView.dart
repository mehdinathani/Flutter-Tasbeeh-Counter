// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/originals/b3/9f/a7/b39fa7a6255973e44eb2027a33d78356.jpg"),
              fit: BoxFit.fill,
              opacity: 0.3,
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(30), // Add space below the widget
              ),
              CircularStepProgressIndicator(
                totalSteps: 34,
                currentStep: zikrCounter,
                stepSize: 10,
                width: 230,
                height: 230,
                roundedCap: (index, _) => true,
                child: Center(
                    child: Text(
                  currentZikar.toString().split(".").last,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              // CircularPercentIndicator(
              //   lineWidth: 30,
              //   radius: 100,
              //   animation: true,
              //   addAutomaticKeepAlive: true,
              //   percent: counter.toDouble() / 100,
              //   progressColor: Colors.green,
              //   center: Text(
              //     currentZikar.toString().split(".").last,
              //     style: const TextStyle(
              //         fontSize: 20, fontWeight: FontWeight.bold),
              //   ),
              // ),
              Text(
                "$zikrCounter",
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
                    onPressed: () {
                      counternum();
                      debugPrint("Counter $counter");
                      debugPrint("Zikr Counter $zikrCounter");
                    },
                    icon: const Icon(
                      Icons.book_rounded,
                      size: 10,
                    ),
                    label: const Text(
                      "Zikr",
                      style: TextStyle(fontSize: 50),
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
              const Expanded(child: SizedBox(height: 10)),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                color: Colors.green,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Created by: Mehdi Abbas Nathani"),
                      Text(
                          "For Reviews and Suggestions: mehdinathani@gmail.com"),
                      Text("Copyright © 2023 TermsFeed®. All rights reserved."),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
