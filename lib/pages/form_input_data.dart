import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputData extends StatefulWidget {
  const InputData({super.key});

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  List<File>? image = [];

  // Fungsi untuk memilih gambar dari galeri
  Future<void> getImage() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile> ImagePicked = await _picker.pickMultiImage();

    image = ImagePicked.map((e) => File(e.path)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget formTextfield() {
      return const Form(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'house name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'latitude',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'longitude',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'access',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Distance',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Map Url',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      );
    }

    Widget imageFile() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (File img in image!)
                Container(
                  height: 60,
                  width: 60,
                  child: Image.file(img),
                ),
              SizedBox(height: 5),
              TextButton(
                onPressed: () async {
                  await getImage();
                },
                child: const Text('Pick Image'),
              ),
            ],
          ),
          Container(
            height: 125,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              image: const DecorationImage(
                image: AssetImage('assets/gallery.png'),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const Center(
            child: Text(
              "Input Data Perumahan",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          formTextfield(),
          const SizedBox(height: 20),
          imageFile(),
          ElevatedButton(
            onPressed: () {},
            child: const Text("ADD DATA"),
          ),
        ],
      ),
    );
  }
}
