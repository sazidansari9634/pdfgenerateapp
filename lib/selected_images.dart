import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pdfgenerateapp/images_list.dart';

class SelectedImages extends StatefulWidget {
  const SelectedImages({super.key});

  @override
  State<SelectedImages> createState() => _SelectedImagesState();
}

class _SelectedImagesState extends State<SelectedImages> {
  ImagesList imagesList = ImagesList();
  late double progressValue = 0;
  late bool isExporting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Selected Images"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        onPressed: (){},
        child: const Text("Convert",style: TextStyle(fontSize: 18),),
        ),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              Visibility(
                visible: isExporting,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: LinearProgressIndicator(
                    minHeight: 25,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                    value: progressValue,
                  ),
                  ),
              ),
               const Gap(10),
                Visibility(
                  visible: !isExporting,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    ),
                    itemCount: imagesList.imagePaths.length,
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                        child: Image(
                          image: FileImage(
                            File(imagesList.imagePaths[index].path),
                        ),
                        fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                )
            ],
          ),
        ),
    );
  }
}