import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoodIcon {
  MoodIcon({
    this.mTitle,
    this.mColor,
    this.mRotation,
    this.mIcon,
  });

  final String mTitle;
  final Color mColor;
  final double mRotation;
  final IconData mIcon;

  factory MoodIcon.fromMap(Map<String, dynamic> json) => MoodIcon(
        mTitle: json["mTitle"],
        mColor: json["mColor"],
        mRotation: json["mRotation"],
        mIcon: json["mIcon"],
      );

  Map<String, dynamic> toMap() => {
        "mTitle": mTitle,
        "mColor": mColor,
        "mRotation": mRotation,
        "mIcon": mIcon,
      };
  List<MoodIcon> _moodIconsList = <MoodIcon>[
    MoodIcon(
        mTitle: 'Very Satisfied',
        mColor: Colors.amber,
        mRotation: 0.4,
        mIcon: Icons.sentiment_very_satisfied),
    MoodIcon(
        mTitle: 'Satisfied',
        mColor: Colors.green,
        mRotation: 0.2,
        mIcon: Icons.sentiment_satisfied),
    MoodIcon(
        mTitle: 'Neutral',
        mColor: Colors.grey,
        mRotation: 0.0,
        mIcon: Icons.sentiment_neutral),
    MoodIcon(
        mTitle: 'Dissatisfied',
        mColor: Colors.cyan,
        mRotation: -0.2,
        mIcon: Icons.sentiment_dissatisfied),
    MoodIcon(
        mTitle: 'Very Dissatisfied',
        mColor: Colors.red,
        mRotation: -0.4,
        mIcon: Icons.sentiment_very_dissatisfied),
  ];

  IconData getMoodIcon(String mood) {
    return _moodIconsList[
            _moodIconsList.indexWhere((element) => element.mTitle == mood)]
        .mIcon;
  }

  Color getMoodColor(String color) {
    return _moodIconsList[
            _moodIconsList.indexWhere((element) => element.mColor == color)]
        .mColor;
  }

  double getMoodRotation(double value) {
    return _moodIconsList[
            _moodIconsList.indexWhere((element) => element.mRotation == value)]
        .mRotation;
  }

  List<MoodIcon> getListMood() {
    return _moodIconsList;
  }
}
