import 'package:flutter/material.dart';

class PlaylistDialogWidget extends StatefulWidget {
  @override
  _PlaylistDialogWidgetState createState() => _PlaylistDialogWidgetState();
}

class _PlaylistDialogWidgetState extends State<PlaylistDialogWidget> {
  int selectedPlaylist = 1; // Default selection

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(16),
        height: 300, // Set a maximum height to the dialog
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add to Playlist",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 2),
            SizedBox(height: 10),
            Expanded(
              child: Scrollbar(
                // Wrap SingleChildScrollView with Scrollbar
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RadioListTile<int>(
                        title: Text('Playlist 1'),
                        value: 1,
                        groupValue: selectedPlaylist,
                        onChanged: (value) {
                          setState(() {
                            selectedPlaylist = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                        title: Text('Playlist 2'),
                        value: 2,
                        groupValue: selectedPlaylist,
                        onChanged: (value) {
                          setState(() {
                            selectedPlaylist = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                        title: Text('Playlist 3'),
                        value: 3,
                        groupValue: selectedPlaylist,
                        onChanged: (value) {
                          setState(() {
                            selectedPlaylist = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                        title: Text('Playlist 4'),
                        value: 4,
                        groupValue: selectedPlaylist,
                        onChanged: (value) {
                          setState(() {
                            selectedPlaylist = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                        title: Text('Playlist 5'),
                        value: 5,
                        groupValue: selectedPlaylist,
                        onChanged: (value) {
                          setState(() {
                            selectedPlaylist = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                        title: Text('Playlist 6'),
                        value: 6,
                        groupValue: selectedPlaylist,
                        onChanged: (value) {
                          setState(() {
                            selectedPlaylist = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                        title: Text('Playlist 7'),
                        value: 7,
                        groupValue: selectedPlaylist,
                        onChanged: (value) {
                          setState(() {
                            selectedPlaylist = value!;
                          });
                        },
                      ),
                      // Add more RadioListTiles for additional playlists
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(selectedPlaylist);
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
