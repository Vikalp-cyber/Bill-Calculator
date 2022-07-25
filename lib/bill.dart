import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double? price = 0.0;
  int totalPerson = 1;
  double tipPercentage = 0.0;
  TextEditingController MyText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Bill Calculator",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Per Person Bill",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Text(
                      "${((price! + ((tipPercentage / 100) * price!)) / totalPerson).toStringAsFixed(1)} Rs",
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ],
                )),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: MyText,
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  setState(() {
                    price = double.parse(MyText.text);
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Enter the Price",
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Split By",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (totalPerson > 1) {
                              totalPerson--;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.exposure_minus_1,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "$totalPerson",
                    style: const TextStyle(fontSize: 25),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        totalPerson++;
                      });
                    },
                    icon: const Icon(Icons.exposure_plus_1, size: 30),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 5,
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Tip Percentage",
                style: TextStyle(fontSize: 25),
              ),
              Slider(
                value: tipPercentage,
                divisions: 10,
                onChanged: (v) {
                  setState(() {
                    tipPercentage = v;
                  });
                },
                min: 0,
                max: 100,
              ),
              Text(
                "$tipPercentage",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}
