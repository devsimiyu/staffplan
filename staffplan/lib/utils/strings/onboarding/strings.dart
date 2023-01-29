import 'package:flutter/foundation.dart' show immutable;

@immutable
class OnboardingStrings {
  static const stock = "Take Stock";
  static const stockImg = "assets/splash/stock.png";
  static const stockDesc =
      "Compare the on-shelf stocks with stocks from the system generated stock";

  static const notes = "Take Notes";
  static const notesImg = "assets/splash/notes.png";
  static const notesDesc =
      "Record the little details that catch your eye for better and detailed feedback";

  static const organize = "Organize Stock";
  static const organizeImg = "assets/splash/arrange.png";
  static const organizeDesc =
      "Organize stock with samples from the recommended standards as well as inspiration from your colleagues";

  static const capture = "Capture Your Great Work";
  static const captureImg = "assets/splash/capture.png";
  static const captureDesc =
      "Capture your work or displays and submit for review and commendation";

  static const next = "Next";
  static const skip = "Skip";

  const OnboardingStrings._();
}
