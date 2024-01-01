import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'detect_screen.dart';

import 'models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<CameraDescription> cameras;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await setupCameras();
  }

  loadModel(model) async {}

  onSelect(model) {
    loadModel(model);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DetectScreen(cameras: cameras, model: model);
    }));
  }

  setupCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      log('Error: $e.code\nError Message: $e.message');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/2.jpg"), // Replace with your image asset
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Flutter App used to view a 3d model\n'
                'To continue ? Press the button', // Replace with your desired text
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text(
                ssd,
                style: TextStyle(color: Colors.brown),
              ),
              onPressed: () => onSelect(ssd),
            ),
          ],
        ),
      ),
    );
  }
}
