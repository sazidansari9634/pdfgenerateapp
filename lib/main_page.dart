import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Generate App"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.teal,
              textColor: Colors.white,
              padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              onPressed: (){
            },
            child: const Text("Gallery Image"),
            ),
            const Gap(10),
            MaterialButton(
              color: Colors.teal,
              textColor: Colors.white,
              padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              onPressed: (){
            },
            child: const Text("Capture Image"),
            )
          ],
        ),
      ),
    );
  }
}