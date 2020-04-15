part of lovelydialogs;

class LovelyCustomDialog extends LovelyDialog {
  final Widget child;

  LovelyCustomDialog({
    @required BuildContext context,
    String title,
    Color color = Colors.grey,
    Gradient gradient,
    Widget leading = const Icon(Icons.palette, color: Colors.white),
    Radius borderRadius,
    ButtonTextTheme buttonsTextTheme,
    bool touchDismissible,
    bool backDismissible,
    @required this.child,
  }) : super(
          context: context,
          title: title,
          color: color,
          gradient: gradient,
          leading: leading,
          borderRadius: borderRadius,
          buttonsTextTheme: buttonsTextTheme,
          touchDismissible: touchDismissible,
          backDismissible: backDismissible,
        );

  @override
  Widget build(BuildContext context) => baseDialog(child);
}
