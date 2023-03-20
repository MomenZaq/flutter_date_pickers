import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Icon button widget built different
/// depends on [MaterialApp] or [CupertinoApp] ancestor.
class IconBtn extends StatelessWidget {
  /// Widget to use inside button.
  ///
  /// Typically [Icon] widget.
  final Widget icon;

  final Color backgroundColor;

  /// Function called when user tap on the button.
  ///
  /// Can be null. In this case button will be disabled.
  final VoidCallback? onTap;

  /// Tooltip for button.
  ///
  /// Applied only for material style buttons.
  /// It means only if widget has [MaterialApp] ancestor.
  final String? tooltip;

  /// Creates button with [icon] different
  /// depends on [MaterialApp] or [CupertinoApp] ancestor.
  const IconBtn(
      {Key? key,
      required this.icon,
      required this.backgroundColor,
      this.onTap,
      this.tooltip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isMaterial = Material.of(context) != null;
    // return _cupertinoBtn();

    // return isMaterial ? _materialBtn() : _cupertinoBtn();
    return _materialBtn();
  }

  Widget _cupertinoBtn() => Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: CupertinoButton(
          padding: const EdgeInsets.all(0.0),
          child: icon,
          onPressed: onTap,
        ),
      );

  Widget _materialBtn() => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: icon,
          tooltip: tooltip ?? "",
          onPressed: onTap,
        ),
      );
}
