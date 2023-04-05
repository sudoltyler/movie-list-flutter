import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_2/Resources/GlobalHelper.dart';
import 'package:url_launcher/url_launcher.dart';

/*
   * Class is required to return a widget, for this it needs
   * the index so it can access the helper(Provider class)
   */
class DisplayImages extends StatelessWidget {
  // Declare variables that are required to invoke this class
  final int index1;
  final int index2;
  final String title;
  final GlobalHelper helper;
  // constructor
  const DisplayImages(this.index1, this.index2, this.title, this.helper);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              shadows: [ Shadow(offset: Offset(1, 1), color: Colors.black38), ]
          ),
        ),
        backgroundColor: Colors.black26,
      ),
      body: GestureDetector(
        onTap: () {
          _launchURL();
        },
        child: Center(
          child: Image.asset(
            helper.getGenre(index1).elementAt(index2),
            // Get dimensions of actual device to make it fit better
            width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.height * .6,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    var url = helper.getMovieIMDB(index1, index2);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch the url';
    }
  }
}