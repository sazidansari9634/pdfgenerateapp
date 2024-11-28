import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdfgenerateapp/images_list.dart';
import 'package:pdfgenerateapp/selected_images.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}
 

class _MainPageState extends State<MainPage> {
  ImagesList imagesList = ImagesList();

 void pickGalleryImage() async {
  final ImagePicker picker = ImagePicker();
  final List<XFile> images = await picker.pickMultiImage();

  if(images.isNotEmpty){
    imagesList.clearImageList();
    imagesList.imagePaths.addAll(images);
    if(!mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SelectedImages()));
  }
 }

 void captureCameraImages() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.camera);

  if(image != null){
    imagesList.clearImageList();
    imagesList.imagePaths.add(image);
  }
   if(!mounted) return;
   Navigator.push(context, MaterialPageRoute(builder: (context)=> const SelectedImages()));
 }
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
              onPressed: pickGalleryImage,
            child: const Text("Gallery Image"),
            ),
            const Gap(10),
            MaterialButton(
              color: Colors.teal,
              textColor: Colors.white,
              padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              onPressed: captureCameraImages,
            child: const Text("Capture Image"),
            )
          ],
        ),
      ),
    );
  }
}