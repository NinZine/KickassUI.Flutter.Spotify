import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const Color _kDefaultBackgroundColor = const Color(0xff424242);

class PlayerBar extends StatelessWidget implements PreferredSizeWidget {

  /// Creates a tab bar in the iOS style.
  PlayerBar({
    Key key,
    this.child,
    this.backgroundColor: _kDefaultBackgroundColor
  }) : super(key: key);

  final Widget child;

  /// The background color of the tab bar. If it contains transparency, the
  /// tab bar will automatically produce a blurring effect to the content
  /// behind it.
  final Color backgroundColor;

  @override
  Size get preferredSize => new Size.fromHeight(42.0);

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    Widget result = new DecoratedBox(
      decoration: new BoxDecoration(
        border: new Border(
          top: new BorderSide(
            color: Colors.white,
            width: 0.0, // One physical pixel.
            style: BorderStyle.solid,
          ),
          bottom: new BorderSide(
            color: Colors.black,
            width: 1.0,
            style: BorderStyle.solid
          )
        ),
        color: backgroundColor,
      ),
      // TODO(xster): allow icons-only versions of the tab bar too.
      child: new SizedBox(
        height: 50 + bottomPadding,
        child: new Container(
          child: child
        ),
      ),
    );

    return result;
  }
}