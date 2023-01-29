import '../animations.dart';
import '../animations_view.dart';

class WelcomeAnimation extends LottieAnimationView {
  const WelcomeAnimation({
    super.key,
  }) : super(
          animation: LottieAnimation.welcome,
        );
}
