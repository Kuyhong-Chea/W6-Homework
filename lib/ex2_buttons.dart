import 'package:flutter/material.dart';

// EX 2 – The buttons (handout page: EX 2)
// A StatelessWidget called CustomButton. Use one enum for the button type
// and one enum for the icon position.

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;
  const ButtonType(this.color);
}

enum IconPosition { left, right }

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                CustomButton(label: 'Submit', icon: Icons.check, type: ButtonType.primary),
                CustomButton(label: 'Time', icon: Icons.lock_clock, type: ButtonType.secondary),
                CustomButton(label: 'Account', icon: Icons.person, type: ButtonType.disabled)
            ],
          ),
        ), // YOUR CODE
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ButtonType type;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.type,
    this.iconPosition = IconPosition.left,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.left) Icon(icon, color: Colors.white,),
          SizedBox(width: 20.0,),
          Text(
            label,
            style: TextStyle(
              color: Colors.white
            ),
          ),
          SizedBox(width: 20.0,),
          if (iconPosition == IconPosition.right) Icon(icon, color: Colors.white,),
        ],
        
      ),
    );
  }

}