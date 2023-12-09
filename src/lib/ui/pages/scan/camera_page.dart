import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as imglib;
import 'package:path_provider/path_provider.dart';

import '../../providers/scanner/scanner_controller_provider.dart';
import '../../providers/scanner/scanner_state.dart';

class CameraPage extends ConsumerStatefulWidget {
  const CameraPage({super.key});

  @override
  ConsumerState<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends ConsumerState<CameraPage>
    with WidgetsBindingObserver {
  CameraController? controller;
  List<CameraDescription> cameras = [];
  Size? screenSize;

  FlashMode flashMode = FlashMode.off;
  CameraDescription? currentCamera;

  bool _isTakingPicture = false;

  File? croppedImage;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      cameras = await availableCameras();
      currentCamera = cameras.last;
      await _initializeCameraController(currentCamera!);
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCameraController(cameraController.description);
    }
  }

  Future<void> _initializeCameraController(
    CameraDescription cameraDescription,
  ) async {
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.ultraHigh,
    );

    controller = cameraController;

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  Widget cameraWidget(context, Size screenSize) {
    if (controller == null || !controller!.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    var camera = controller!.value;

    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = screenSize.aspectRatio * camera.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Transform.scale(
      scale: scale,
      child: Center(
        child: CameraPreview(controller!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(scannerControllerProvider, (_, ScannerState state) {
      if (state is ScannerStateScanning) {
        Navigator.popAndPushNamed(context, '/scan/result');
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: controller != null && controller!.value.isInitialized
                ? LayoutBuilder(builder: (context, constraints) {
                    screenSize ??= Size(
                      constraints.maxWidth,
                      constraints.maxHeight,
                    );

                    return cameraWidget(context, screenSize!);
                  })
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          // show where to position the camera
          Positioned.fill(
            child: _buildCameraOverlay(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 82,
            child: _buildActionButtons(),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraOverlay() {
    // mask

    double aspectRatio = 85.6 / 53.98;
    double padding = 16;
    Color color = Colors.black.withOpacity(0.5);

    return LayoutBuilder(
      builder: (context, constraints) {
        double parentAspectRatio = constraints.maxWidth / constraints.maxHeight;
        double horizontalPadding;
        double verticalPadding;

        if (parentAspectRatio < aspectRatio) {
          horizontalPadding = padding;
          verticalPadding = (constraints.maxHeight -
                  ((constraints.maxWidth - 2 * padding) / aspectRatio)) /
              2;
        } else {
          verticalPadding = padding;
          horizontalPadding = (constraints.maxWidth -
                  ((constraints.maxHeight - 2 * padding) * aspectRatio)) /
              2;
        }

        return Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: horizontalPadding,
                color: color,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: horizontalPadding,
                color: color,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(
                  left: horizontalPadding,
                  right: horizontalPadding,
                ),
                height: verticalPadding,
                color: color,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                  left: horizontalPadding,
                  right: horizontalPadding,
                ),
                height: verticalPadding,
                color: color,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green[400]!,
                  width: 4,
                ),
              ),
            ),
            // add corners, white
            Positioned(
              top: verticalPadding - 2,
              left: horizontalPadding - 2,
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  // border left and top
                  border: Border(
                    left: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                    top: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: verticalPadding - 2,
              right: horizontalPadding - 2,
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  // border right and top
                  border: Border(
                    right: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                    top: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: verticalPadding - 2,
              left: horizontalPadding - 2,
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  // border left and bottom
                  border: Border(
                    left: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: verticalPadding - 2,
              right: horizontalPadding - 2,
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  // border right and bottom
                  border: Border(
                    right: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                ),
              ),
            ),
            // text below the mask
            Positioned(
              bottom: verticalPadding - (2 + 32 + 16 + 24),
              left: horizontalPadding * 2,
              right: horizontalPadding * 2,
              child: Text(
                'Hold the card inside the frame. It will be scanned automatically.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget actionButton(
    Widget icon,
    VoidCallback? onPressed,
    Size size,
    Color bgColor,
    Color fgColor,
  ) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: fgColor,
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        actionButton(
          flashMode == FlashMode.off
              ? const Icon(Icons.flashlight_off)
              : const Icon(Icons.flashlight_on),
          () {
            setState(() {
              if (flashMode == FlashMode.off) {
                controller!.setFlashMode(FlashMode.always);
                flashMode = FlashMode.always;
              } else {
                controller!.setFlashMode(FlashMode.off);
                flashMode = FlashMode.off;
              }
            });
          },
          const Size(56, 56),
          flashMode == FlashMode.always
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.background,
          flashMode == FlashMode.always
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onBackground,
        ),
        const SizedBox(width: 24),
        actionButton(
          _isTakingPicture
              ? Center(
                  child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.onPrimary,
                  ),
                ))
              : const Icon(Icons.camera_alt),
          _isTakingPicture ? null : _takePicture,
          const Size(84, 84),
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.onPrimary,
        ),
        const SizedBox(width: 24),
        actionButton(
          const Icon(Icons.flip_camera_ios),
          () {
            setState(() {
              if (currentCamera == cameras.first) {
                currentCamera = cameras.last;
              } else {
                currentCamera = cameras.first;
              }
              _initializeCameraController(currentCamera!);
            });
          },
          const Size(56, 56),
          Theme.of(context).colorScheme.background,
          Theme.of(context).colorScheme.onBackground,
        ),
      ],
    );
  }

  Future<void> _takePicture() async {
    if (controller == null || !controller!.value.isInitialized) {
      return;
    }

    setState(() {
      _isTakingPicture = true;
    });

    try {
      final XFile picture = await controller!.takePicture();

      final decode = imglib.Command()..decodeImage(await picture.readAsBytes());

      await decode.executeThread();

      imglib.Image? image = decode.outputImage;

      if (image == null) {
        return;
      }

      const double aspectRatio = 85.6 / 53.98;
      const double padding = 16;

      double horizontalPadding;
      double verticalPadding;

      if (image.width / image.height < aspectRatio) {
        horizontalPadding = padding;
        verticalPadding =
            (image.height - ((image.width - 2 * padding) / aspectRatio)) / 2;
      } else {
        verticalPadding = padding;
        horizontalPadding =
            (image.width - ((image.height - 2 * padding) * aspectRatio)) / 2;
      }

      final crop = imglib.Command()
        ..image(image)
        ..copyCrop(
          x: horizontalPadding.toInt(),
          y: verticalPadding.toInt(),
          width: (image.width - 2 * horizontalPadding).toInt(),
          height: (image.height - 2 * verticalPadding).toInt(),
        )
        ..getBytes();

      await crop.executeThread();

      // save to temp dir
      final tempDir = await getTemporaryDirectory();

      final tempPath = '${tempDir.path}/scanned_and_cropped_image.jpg';

      final file = File(tempPath);

      await file.writeAsBytes(imglib.encodeJpg(crop.outputImage!));

      croppedImage = file;

      _scanResult(file);

      setState(() {});
    } on CameraException {
      // pass
    } finally {
      setState(() {
        _isTakingPicture = false;
      });
    }
  }

  Future<void> _scanResult(File image) async {
    await ref.read(scannerControllerProvider.notifier).scan(image);
  }
}
