// create_playlist_dialog.dart

import 'package:flutter/material.dart';

class CreateListDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Playlist'),
      content: Column(
        mainAxisSize: MainAxisSize.min, // Set to min to reduce vertical space
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Playlist Name'),
          ),
          SizedBox(height: 8), // Add some vertical space between the fields
          TextField(
            decoration: InputDecoration(labelText: 'Image URL'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Create'),
        ),
      ],
    );
  }
}
