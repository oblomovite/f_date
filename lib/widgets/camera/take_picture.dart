import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class TakePicture extends StatefulWidget {
  final CameraDescription camera;

  TakePicture({@required this.camera});

  @override
  _TakePictureState createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  /*late final */ CameraController _controller;
  /*late final */ Future<void> _initController;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );

    _initController = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _takePhoto(BuildContext context) async {
    // ensure controller is ready
    await _initController;

    // Fiel name and path
    final dir = await getTemporaryDirectory();

    /// Add user_id to this
    final name = "pic_${DateTime.now()}.png";

    // Common strategy to avoid file name conflicts - rely on on current date and time
    final fullPath = p.join(dir.path, name);

    // TODO :: update package to be able to pass path to takePicture method
    await _controller.takePicture();


    Scaffold.of(context).showSnackBar(SnackBar(
      content: const Text("Picture Taken"),
      duration: const Duration(milliseconds: 600),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FutureBuilder<void>(
          future: _initController,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: CameraPreview(_controller),
                  ),
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.photo_camera),
          onPressed: () => _takePhoto(context),
        ),
      ],
    );
  }
}
