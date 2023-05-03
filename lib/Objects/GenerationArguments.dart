import 'Mood.dart';

class GenerationArguments
{
  List<Mood> moods = [];
  GenerationRoutes route;

  GenerationArguments(this.route);
}

enum GenerationRoutes
{
  Both,
  CameraOnly,
  SensorOnly,
  Presets,
}