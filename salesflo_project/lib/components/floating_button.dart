import 'package:flutter/material.dart';
 
class AppFloatingButton extends StatelessWidget {
  const AppFloatingButton({
    Key? key,
    this.onPressed,
    this.heroTag,
    this.isLoading = false,
    this.floatingButtonSize,
    this.foregroundColor,
    this.mini = false,
    this.elevation = 0.0,
    this.autoFocus = false,
    this.disabledElevation,
    this.enableFeedback = true,
    this.tooltip,
    this.hoverColor,
    this.focusColor,
    this.splashColor,
    this.focusElevation,
    this.highlightElevation,
    this.hoverElevation,
    this.isExtended = false,
    this.materialTapTargetSize,
    this.backgroundColor,
    this.icon,
    }) : super(key: key);

final Function()? onPressed;
final Object? heroTag;
final bool isLoading;
final Size? floatingButtonSize;
final bool mini;
final double? elevation;
final double? disabledElevation;
final double? focusElevation;
final double? hoverElevation;
final double? highlightElevation;
final bool autoFocus;
final bool enableFeedback;
final String? tooltip;
final Color? backgroundColor;
final Color? foregroundColor;
final Color? hoverColor;
final Color? focusColor;
final Color? splashColor;
final bool isExtended;
final MaterialTapTargetSize? materialTapTargetSize;
final Widget? icon;

 
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: isLoading ? null : onPressed,
      heroTag: heroTag,
      backgroundColor:  backgroundColor ?? Colors.indigo,
      foregroundColor: foregroundColor,
      mini: mini,
      elevation: elevation,
      autofocus: autoFocus,
      disabledElevation: disabledElevation,
      enableFeedback: enableFeedback,
      tooltip: tooltip,
      hoverColor: hoverColor,
      focusColor: focusColor,
      splashColor: splashColor,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: highlightElevation,
      isExtended: isExtended,
      materialTapTargetSize: materialTapTargetSize,
      child: icon ?? const Icon(Icons.add),

      );
  }
}
