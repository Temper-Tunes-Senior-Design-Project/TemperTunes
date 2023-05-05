enum Mood {
  Angry,
  Tired,
  Content,
  Depressed,
  Energetic,
  Excited,
  Happy,
  Sad; //If not found

  @override
  String toString() => this.name.toLowerCase();

  Mood getMoodFromArousal(double arousal) {
    double valence = 0.0;
    int LOW = 0;
    int MEDIUM = 1;
    int HIGH = 2;
    //get size label of valence and arousal
    int toLabeledSize(double val) => (val >= 0.5)
        ? HIGH
        : (val <= -0.5)
            ? LOW
            : MEDIUM;
    var valenceLabel = toLabeledSize(valence);
    var arousalLabel = toLabeledSize(arousal);

    if (valenceLabel == MEDIUM && arousalLabel == MEDIUM) {
      //case where both are medium
      valenceLabel = (valence > 0.25)
          ? HIGH
          : (valence < -0.25)
              ? LOW
              : MEDIUM;
      arousalLabel = (arousal > 0.25)
          ? HIGH
          : (arousal < -0.25)
              ? LOW
              : MEDIUM;
      //check if they are both still medium
      if (valenceLabel == MEDIUM && arousalLabel == MEDIUM) {
        var valenceIsBiggerExtreme = (valence.abs() <= arousal.abs());
        valenceLabel = (valenceIsBiggerExtreme)
            ? (valence < 0)
                ? LOW
                : HIGH
            : valenceLabel;
        arousalLabel = (!valenceIsBiggerExtreme)
            ? (arousal < 0)
                ? LOW
                : HIGH
            : arousalLabel;
      }
    }
    return Mood.Happy;
  }
}

extension MoodExtension on Mood {
  String getImage() {
    switch (this) {
      case Mood.Angry:
        return "assets/angry.png";
      case Mood.Tired:
        return "assets/tired.png";
      case Mood.Content:
        return "assets/content.png";
      case Mood.Depressed:
        return "assets/depressed.png";
      case Mood.Energetic:
        return "assets/energetic.png";
      case Mood.Excited:
        return "assets/excited.png";
      case Mood.Happy:
        return "assets/happy.png";
      case Mood.Sad:
        return "assets/sad.png";
    }
  }

  double getValence() {
    switch (this) {
      case Mood.Angry:
        return -1.0;
      case Mood.Tired:
        return 0.0;
      case Mood.Content:
        return 1.0;
      case Mood.Depressed:
        return -1.0;
      case Mood.Energetic:
        return 0.0;
      case Mood.Excited:
        return 1.0;
      case Mood.Happy:
        return 1.0;
      case Mood.Sad:
        return -1.0;
    }
  }

  double getArousal() {
    switch (this) {
      case Mood.Angry:
        return 1.0;
      case Mood.Tired:
        return -1.0;
      case Mood.Content:
        return -1.0;
      case Mood.Depressed:
        return -1.0;
      case Mood.Energetic:
        return 1.0;
      case Mood.Excited:
        return 1.0;
      case Mood.Happy:
        return 0.0;
      case Mood.Sad:
        return 0.0;
    }
  }
}

var valenceArousalToLabel = [
  //Low, Medium, High Arousal
  [Mood.Depressed, Mood.Sad, Mood.Angry], //Low Valence
  [Mood.Tired, Mood.Energetic], //Medium Valence
  [Mood.Content, Mood.Happy, Mood.Excited], //High Valence
];
