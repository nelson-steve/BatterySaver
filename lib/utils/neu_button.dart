import 'package:battery_saver_app/utils/Text1.dart';
import 'package:battery_saver_app/utils/popup.dart';
import 'package:flutter/material.dart';

class NeuButton extends StatefulWidget {
  final String button;
  final String statement;
  NeuButton({Key? key, required this.button, required this.statement})
      : super(key: key);

  @override
  State<NeuButton> createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool buttonClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => setState(() {
        buttonClicked = !buttonClicked;
      }),
      onLongPressUp: () => setState(() {
        buttonClicked = !buttonClicked;
        Future.delayed(Duration(seconds: 1));
        PopUp();
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: ((context) => PopUp())));
        // Navigator.push(context, MaterialPageRoute(builder: (_) => PopUp()));
      }),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  blurRadius: buttonClicked ? 0.0 : 5.0,
                  spreadRadius: 5.0,
                  // offset: Offset(10, 10),
                  color: Colors.indigo)
            ]),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text1(
            textString: widget.button,
            textColor: Colors.white,
            textFont: 20,
          ),
        ),
      ),
    );
  }

  Future PopUp() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Notification',
              ),
              content: Text('This is in fact a notification'),
            ));
  }
}
