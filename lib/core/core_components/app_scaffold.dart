import 'package:flutter/material.dart';
class AppScaffold extends StatelessWidget {
  const AppScaffold({Key? key, this.body, this.appBar, this.drawer, this.bottomNavigationBar}) : super(key: key);
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          if(body!=null)
            SafeArea(child: body!)
        ],
      ),
      appBar: appBar,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
