import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rest_api/methods/api_post_methods.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? image;
  Uint8List? imageBytes;
  String? fileName;
  bool isLoading = false;
  Future<void> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (file != null) {
      setState(() {
        image = File(file.path);
        fileName = file.name;
      });
      imageBytes = await file.readAsBytes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Text("Upload Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  await pickImage();
                },
                child: Container(
                  color: Colors.grey.shade200,
                  width: double.infinity,
                  height: 200,
                  child:
                      isLoading
                          ? Center(child: CircularProgressIndicator())
                          : image == null
                          ? Icon(Icons.upload_file, size: 40)
                          : Image.file(image!),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  setState(() => isLoading = true);
                  await uploadFileAPI(context, imageBytes!, fileName!);
                  setState(() => isLoading = false);
                  image = null;
                },
                child: Text("UPLOAD", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
