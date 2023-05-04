import 'Mood.dart';

class GenerationArguments
{
  List<Mood> moods = [];
  GenerationRoutes route;
  int numberOfSongs = 50;
  int newSongPercentage = 0;

  GenerationArguments(this.route);
}

enum GenerationRoutes
{
  Both,
  CameraOnly,
  SensorOnly,
  Presets,
}