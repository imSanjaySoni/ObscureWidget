import 'dart:io' show Platform;
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Controller for **[ObscureWidget]** listen captured state from platform.

class ObscureWidgetController {
  static const _channel = EventChannel('obscure_widget_channel');
  static final _instance = ObscureWidgetController._private();

  final _isCapturedNotifier = ValueNotifier<bool>(false);
  static ValueNotifier<bool> get isCaptured => _instance._isCapturedNotifier;

  ObscureWidgetController._private() {
    if (Platform.isIOS) {
      _channel.receiveBroadcastStream().distinct().listen((event) {
        _isCapturedNotifier.value = event as bool;
      });
    }
  }
}

/// blur it's **child** when screen is being captured/recorded.
///
///* **[blur]** is the value of blur effect, higher the blur more the blur effect (default value = 5)
///
///* **[blurColor]** is the color of blur effect (default value = Colors.white)
///
///* **[borderRadius]** is the radius of the child to be blurred
///
///* **[colorOpacity]** is the opacity of the blurColor (default value = 0.5)

class ObscureWidget extends StatelessWidget {
  const ObscureWidget({
    super.key,
    required this.child,
    this.blur = 5,
    this.blurColor = Colors.white,
    this.borderRadius,
    this.colorOpacity = 0.5,
  });

  final Widget child;
  final double blur;
  final Color blurColor;
  final BorderRadius? borderRadius;
  final double colorOpacity;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      builder: (_, isCaptured, child) {
        if (isCaptured == false) return child!;

        return ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: Stack(
            children: [
              child!,
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                  child: Container(
                    decoration: BoxDecoration(
                      color: blurColor.withOpacity(colorOpacity),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      valueListenable: ObscureWidgetController.isCaptured,
      child: child,
    );
  }
}

/// extension of **[ObscureWidget]** on **[Widget]** to blur it's child when screen is being captured/recorded.
///
/// same as a **ObscureWidget** widget but you can use this as an extension on any widget which
/// you want to have a blur effect.
///
///* **blur** is the value of blur effect, higher the blur more the blur effect (default value = 5)

extension BlurExtension on Widget {
  ObscureWidget obscured({
    double blur = 5,
    Color blurColor = Colors.white,
    BorderRadius? borderRadius,
    double colorOpacity = 0.5,
  }) {
    return ObscureWidget(
      blur: blur,
      blurColor: blurColor,
      borderRadius: borderRadius,
      colorOpacity: colorOpacity,
      child: this,
    );
  }
}
