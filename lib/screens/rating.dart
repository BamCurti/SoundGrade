import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:soundgrade/utils/style.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _rating = 0.0;
  String _comment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating Page'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              RatingBar.builder(
                  initialRating: 2.5,
                  minRating: .0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                      CupertinoIcons.heart_fill,
                      color: accentColorOrange),
                  onRatingUpdate: (rating) {
                    _rating = rating;
                  }),
              TextFormField(
                maxLines: null,
                decoration: const InputDecoration(labelText: 'Comment'),
                validator: (value) {},
                onSaved: (value) {},
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
