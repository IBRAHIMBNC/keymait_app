import 'package:flutter/material.dart';
import 'package:keymait_app/widgets/smallText.dart';

class NavButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;
  final String text;
  NavButton({
    required this.onTap,
    required this.position,
    required this.length,
    required this.index,
    required this.child,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(index);
        },
        child: Container(
            height: 75.0,
            child: Transform.translate(
              offset: Offset(
                  0, difference < 1.0 / length ? verticalAlignment * 40 : 0),
              child: Opacity(
                  opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      child,
                      SizedBox(
                        height: 8,
                      ),
                      SmallText(
                        fontWeight: FontWeight.bold,
                        size: 10,
                        text: text,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 4,
                      )
                    ],
                  )),
            )),
      ),
    );
  }
}
