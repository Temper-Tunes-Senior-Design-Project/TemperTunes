import 'Mood.dart';

class GenerationArguments {
  List<Mood> moods = [];
  GenerationRoutes route;
  int numberOfSongs = 50;
  double newSongPercentage = 0.5;

  GenerationArguments(this.route);
}

enum GenerationRoutes {
  Both,
  CameraOnly,
  SensorOnly,
  Presets,
}
