import 'package:flutter/material.dart';

class FavoriteIconsDialog extends StatefulWidget {
  @override
  _FavoriteIconsDialogState createState() => _FavoriteIconsDialogState();
}

class _FavoriteIconsDialogState extends State<FavoriteIconsDialog> {
  List<bool> isHovering = [false, false, false, false, false];
  bool isRated = false;
  int selectedIconIndex = -1;

  void _onRateButtonPressed() {
    if (!isRated) {
      // Save the number of filled hearts
      int numberOfHeartsFilled =
          selectedIconIndex + 1; // +1 because indices are zero-based

      // TODO: Perform actions to save the 'numberOfHeartsFilled' data
      // For example, you could use shared preferences or other storage mechanisms.

      // Close the dialog
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return MouseRegion(
              onEnter: (_) {
                if (!isRated) {
                  setState(() {
                    for (int i = 0; i <= index; i++) {
                      isHovering[i] = true;
                    }
                  });
                }
              },
              onExit: (_) {
                if (!isRated) {
                  setState(() {
                    for (int i = 0; i <= index; i++) {
                      if (i != selectedIconIndex) {
                        isHovering[i] = false;
                      }
                    }
                  });
                }
              },
              child: GestureDetector(
                onTap: () {
                  if (!isRated) {
                    setState(() {
                      if (selectedIconIndex == index) {
                        // If the same icon is tapped again, reset
                        selectedIconIndex = -1;
                      } else {
                        selectedIconIndex = index;
                      }
                    });
                  }
                },
                child: Icon(
                  index <= selectedIconIndex || isHovering[index]
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color:
                      index <= selectedIconIndex || isRated ? Colors.red : null,
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 20), // Add some space between icons and the button
        ElevatedButton(
          onPressed: isRated ? null : _onRateButtonPressed,
          child: Text('Rate'),
        ),
      ],
    );
  }
}
