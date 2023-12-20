import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class TempScreen extends StatefulWidget {
  const TempScreen({super.key});

  @override
  State<TempScreen> createState() => _TempScreenState();
}

ScreenshotController screenshotController = ScreenshotController();

class _TempScreenState extends State<TempScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              screenshotController.capture().then(
                (Uint8List? image) async {
                  await ImageGallerySaver.saveImage(image!);
                },
              );
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Screenshot(
          controller: screenshotController,
          child: const Column(
            children: [
              TempFrontSide(),
              SizedBox(height: 10),
              TempBackSide(),
            ],
          ),
        ),
      ),
    );
  }
}

// Template Front Side
class TempFrontSide extends StatelessWidget {
  const TempFrontSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Image.asset('assets/temp_1.png'),
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'User name',
                  border: InputBorder.none,
                ),
              ),
            ),
            // Role
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 45),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Role',
                  border: InputBorder.none,
                ),
              ),
            ),

            //Phone
            const Padding(
              padding: EdgeInsets.only(left: 60, top: 85),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Phone number',
                  border: InputBorder.none,
                ),
              ),
            ),

            //Website adreess
            const Padding(
              padding: EdgeInsets.only(left: 60, top: 115),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Web adress',
                  border: InputBorder.none,
                ),
              ),
            ),

            //Location
            const Padding(
              padding: EdgeInsets.only(left: 60, top: 145),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Location',
                  border: InputBorder.none,
                ),
              ),
            ),

            //Logo
            Padding(
              padding: const EdgeInsets.only(left: 280, top: 100),
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  'Select logo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),

            //Logo name
            const Padding(
              padding: EdgeInsets.only(left: 280, top: 130),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Logo Name',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Template back side
class TempBackSide extends StatelessWidget {
  const TempBackSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Image.asset('assets/temp_1_back.png'),
        ],
      ),
    );
  }
}
