## Discouraged

This package was an attempt to solve a problem that was already solved by the `FittedBox` widget.
Just use `FittedBox` instead:

``` dart
FittedBox(
    fit: BoxFit.scaleDown,
    child: // widget to auto scale
)
```

## Original description

Wrap your widgets with `FitOrScale` to make them scale down if their available space is below a `minWidth` and/or a `minHeight`.


This might help with responsive design in situations where you don't want to remove elements but you encounter overflow issues if you don't.

This should probably be used for specific scenarios such as very small screen. In other cases, you should probably just provide a less detailed version of your widget (use an overflow menu instead of displaying several icons for instance).

![Example demo](media/example_demo.gif)

Note how the text  and the icons scale down instead of being cut / having overflow issues when the screen size become too small.

## Usage

```dart
FitOrScale(
    // Scale down when you reach minWidth
    minWidth: 418,
    // Scale down when you reach minHeight
    minHeight: 170,
    // Help define the minWidth and minHeight values by showing current dimensions of your child. It
    // is not shown in release mode
    showSizeOverlay: false,
    // Alignment of the scaled down child, when it is scaled down
    alignment: Alignment.center,
    // Your widget
    child: YourWidget(),
)
```

**Note:** FitOrScale must have constrained width and height. You can use `Flexible` or `Expanded` in `Column` or `Row` for instance, or a `SizedBox`, `ConstrainedBox`, `Container` or similar for a more fixed size.

## Feedback

If you have any feedback, issue or ideas for this package, feel free to fill an issue.