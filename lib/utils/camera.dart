import 'package:camera/camera.dart';

List<CameraDescription>? cameras;

void initCameras() async {
  cameras = await availableCameras();
}

List<CameraDescription>? getCameras() {
  return cameras;
}
