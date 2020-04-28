import 'package:flutter/material.dart';
import 'default_styles.dart' show defaultHeaderTextStyle;

class CalendarHeader extends StatelessWidget {
  /// Passing in values for [leftButtonIcon] or [rightButtonIcon] will override [headerIconColor]
  CalendarHeader(
      {@required this.headerTitle,
      this.headerMargin,
      this.showHeader,
      this.headerTextStyle,
      this.showHeaderButtons,
      this.headerIconColor,
      this.leftButtonIcon,
      this.rightButtonIcon,
      @required this.onLeftButtonPressed,
      @required this.onRightButtonPressed,
      this.isTitleTouchable,
      @required this.onHeaderTitlePressed});

  final String headerTitle;
  final EdgeInsetsGeometry headerMargin;
  final bool showHeader;
  final TextStyle headerTextStyle;
  final bool showHeaderButtons;
  final Color headerIconColor;
  final Widget leftButtonIcon;
  final Widget rightButtonIcon;
  final VoidCallback onLeftButtonPressed;
  final VoidCallback onRightButtonPressed;
  final bool isTitleTouchable;
  final VoidCallback onHeaderTitlePressed;

  TextStyle get getTextStyle =>
      headerTextStyle != null ? headerTextStyle : defaultHeaderTextStyle;

  Widget _leftButton(context) => IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: onLeftButtonPressed,
        icon: leftButtonIcon ??
            Icon(Icons.arrow_back_ios,
                size: MediaQuery.of(context).size.width * 0.05,
                color: headerIconColor),
      );

  Widget _rightButton(context) => IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: onRightButtonPressed,
        icon: rightButtonIcon ??
            Icon(Icons.arrow_forward_ios,
                size: MediaQuery.of(context).size.width * 0.05,
                color: headerIconColor),
      );

  Widget _headerTouchable() => FlatButton(
        onPressed: onHeaderTitlePressed,
        child: Text(
          headerTitle,
          semanticsLabel: headerTitle,
          style: getTextStyle,
        ),
      );

  @override
  Widget build(BuildContext context) => showHeader
      ? Container(
          height: MediaQuery.of(context).size.height * 0.08,
          color: Colors.grey[200],
          margin: headerMargin,
          child: DefaultTextStyle(
              style: getTextStyle,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    showHeaderButtons ? _leftButton(context) : Container(),
                    isTitleTouchable
                        ? _headerTouchable()
                        : Text(headerTitle, style: getTextStyle),
                    showHeaderButtons ? _rightButton(context) : Container(),
                  ])),
        )
      : Container();
}
