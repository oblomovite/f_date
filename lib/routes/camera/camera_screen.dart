import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class CameraScreen extends StatefulWidget {
  /*
   * ::TODO:: 
   * figure out where/when to actually intialize camera
   * and whether this constructor should depend it 
   */
  late final CameraDescription camera;
  // CameraScreen(
    // {required this.camera}
  // );

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with
/* Binds the widget tree to the Flutter engine -- whatever that means */
        WidgetsBindingObserver,
        TickerProviderStateMixin {
  late final CameraController _controller;
  late final Future<void> _initController;
  XFile? imageFile;
  XFile? videoFile;

  // VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);

    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );

    _initController = _controller.initialize();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
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

  /// Returns a suitable camera icon for [direction].
  IconData getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        throw ArgumentError('Unknown lens direction');
    }
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
