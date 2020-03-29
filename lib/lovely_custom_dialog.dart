part of lovelydialogs;

class LovelyCustomDialog extends LovelyDialog {
	final Widget child;

  LovelyCustomDialog({
    @required BuildContext context,
    Color color = Colors.blue,
		Gradient gradient,
    Widget leading = const Icon(Icons.info, color: Colors.white),
    String title = '',
		
		@required this.child,

  }) : super(context: context, color: color, gradient: gradient, leading: leading, title: title);

  @override
  Widget build(BuildContext context) => baseDialog(child);
}
