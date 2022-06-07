library fit_or_scale;

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FitOrScale extends StatelessWidget {
  /// Set the [minWidth] from which the [child] should start to be scaled down
  final double? minWidth;

  /// Set the [minHeight] from which the [child] should start to be scaled down
  final double? minHeight;

  /// Widget that should eventually be scaled based on the [minWidth] and [minHeight]
  final Widget child;

  /// Shows size of the [child] on top of it for debug purposes. It won't be
  /// shown in release mode
  final bool showSizeOverlay;

  /// Alignment of the scaled down [child] when it reaches [minWidth] or [minHeight]
  final Alignment alignment;

  /// Wrap your [child] with [FitOrScale] and set [minWidth] and/or [minHeight]
  /// to make it scale down when it reaches these limits
  const FitOrScale({
    Key? key,
    this.minWidth,
    this.minHeight,
    required this.child,
    this.showSizeOverlay = false,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      Widget result = child;
      double? ratioW, ratioH;
      if (minWidth != null && minWidth! > constraints.maxWidth) {
        if (constraints.maxWidth == double.infinity) {
          throw "Unconstrained width. Wrap FitOrScale with a constraining widget (Flexible, Expanded, SizedBox, ConstrainedBox...)";
        }
        ratioW = constraints.maxWidth / minWidth!;
      }
      if (minHeight != null && minHeight! > constraints.maxHeight) {
        if (constraints.maxHeight == double.infinity) {
          throw "Unconstrained height. Wrap FitOrScale with a constraining widget (Flexible, Expanded, SizedBox, ConstrainedBox...)";
        }
        ratioH = constraints.maxHeight / minHeight!;
      }
      if (minWidth == null && minHeight == null) {
        result = child;
      } else if ((minWidth == null || minWidth! < constraints.maxWidth) &&
          (minHeight == null || minHeight! < constraints.maxHeight)) {
        result = child;
      } else {
        final alignedChild = Align(alignment: alignment, child: child);
        if (ratioW != null && (ratioH == null || ratioW < ratioH)) {
          // Scale based on width
          result = Transform.scale(
            scale: ratioW,
            child: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: SizedBox(
                width: minWidth,
                height:
                    constraints.maxHeight * (minWidth! / constraints.maxWidth),
                child: alignedChild,
              ),
            ),
          );
        } else if (ratioH != null && (ratioW == null || ratioH <= ratioW)) {
          // Scale based on height
          result = Transform.scale(
            scale: ratioH,
            child: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: SizedBox(
                width:
                    constraints.maxWidth * (minHeight! / constraints.maxHeight),
                height: minHeight,
                child: alignedChild,
              ),
            ),
          );
        }
      }
      if (showSizeOverlay && kDebugMode) {
        return Stack(children: [
          Align(
            alignment: alignment,
            child: result,
          ),
          Center(
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Text(
                "${constraints.maxWidth.toStringAsFixed(1)}x${constraints.maxHeight.toStringAsFixed(1)}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: min(
                      min(constraints.maxWidth, constraints.maxHeight) / 10,
                      32.0),
                ),
              ),
            ),
          ),
        ]);
      } else {
        return result;
      }
    });
  }
}
