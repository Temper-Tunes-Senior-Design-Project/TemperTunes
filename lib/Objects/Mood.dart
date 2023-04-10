enum Mood {
  Angry,
  Calm,
  Content,
  Depressed,
  Energetic,
  Excited,
  Happy,
  Sad,
  Neutral //If not found
}

var valenceArousalToLabel = [
  //Low, Medium, High Arousal
  [Mood.Depressed, Mood.Sad, Mood.Angry], //Low Valence
  [Mood.Calm, Mood.Neutral, Mood.Energetic], //Medium Valence
  [Mood.Content, Mood.Happy, Mood.Excited], //High Valence
];
