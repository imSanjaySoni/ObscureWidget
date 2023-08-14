import 'dart:io' show Platform;
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Controller for **[ObscureWidget]** listen captured state from platform.

class ObscureWidgetController extends ValueNotifier<bool> {
  static const _channel = EventChannel('obscure_widget_channel');

  ObscureWidgetController() : super(false) {
    if (Platform.isIOS) {
      _channel.receiveBroadcastStream().distinct().listen((event) {
        value = event as bool;
      });
    }
  }

  bool get isCapturing => value == true;
}

/// blur it's **child** when screen is being captured/recorded.
class ObscureWidget extends StatelessWidget {
  ///
  ///* **[blur]** is the value of blur effect, higher the blur more the blur effect (default value = 5)
  ///
  ///* **[blurColor]** is the color of blur effect (default value = Colors.white)
  ///
  ///* **[borderRadius]** is the radius of the child to be blurred
  ///
  ///* **[colorOpacity]** is the opacity of the blurColor (default value = 0.5)
  ///
  const ObscureWidget({
    Key? key,
    required Widget child,
    double blur = 5,
    Color blurColor = Colors.white,
    BorderRadius? borderRadius,
    double colorOpacity = 0.5,
  })  : _builder = null,
        _child = child,
        _blur = blur,
        _blurColor = blurColor,
        _colorOpacity = colorOpacity,
        _borderRadius = borderRadius,
        super(key: key);

  ///
  ///* use **[obscureBuilder]** to create custom obscure implementation
  ///
  const ObscureWidget.builder({
    Key? key,
    Widget? child,
    required Widget Function(BuildContext context, bool isCaptured, Widget? child) obscureBuilder,
  })  : _builder = obscureBuilder,
        _child = child,
        _blur = 5,
        _blurColor = Colors.white,
        _colorOpacity = 0.5,
        _borderRadius = null,
        super(key: key);

  final Widget? _child;
  final double _blur;
  final Color _blurColor;
  final BorderRadius? _borderRadius;
  final double _colorOpacity;
  final Widget Function(BuildContext, bool, Widget?)? _builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      builder: _builder ??
          (_, isCaptured, child) {
            if (isCaptured == false) return child!;

            return ClipRRect(
              borderRadius: _borderRadius ?? BorderRadius.zero,
              child: Stack(
                children: [
                  child!,
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: _blur, sigmaY: _blur),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _blurColor.withOpacity(_colorOpacity),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
      valueListenable: ObscureWidgetController(),
      child: _child,
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
