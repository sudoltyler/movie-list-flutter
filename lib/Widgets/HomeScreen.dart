import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DisplayImages.dart';
import '../Resources/GlobalHelper.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieListHome extends StatefulWidget {
  const MovieListHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MovieListHomeState();
}

class _MovieListHomeState extends State<MovieListHome> {
  // Declare an instance for the provider class
  static late GlobalHelper helper;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // Initialize the instance for the provider class
    helper = Provider.of<GlobalHelper>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: movieSliverList()
      ),
    );
  }

  // 
  // Create and return slivers for home page including top appbar,
  // and sliver lists for each movie genre
  // 
  List<Widget> movieSliverList() {
    var widgetList = <Widget>[];

    // create top app bar
    widgetList.add (
      SliverAppBar(
        pinned: true,
        expandedHeight: 160.0,
        flexibleSpace: Stack(
          children: const <Widget>[
            Positioned.fill(
                child: Image(image: AssetImage('assets/images/movies.jpg'),
                  fit: BoxFit.cover,
                )
            ),
            Positioned.fill(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    "Movies",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        shadows: [ Shadow(offset: Offset(2, 2), color: Colors.black38), ]
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );

    // loop for num genres and create widgets for each
    for (int index1 = 0; index1 < helper.getGenres().length; index1++) {
      widgetList.add(
        SliverAppBar(
          title: Text(
            helper.getGenreName(index1),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          pinned: true,

        )
      );
      widgetList.add(
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container (
                color: index1.isOdd ? Colors.black26 : Colors.black12,
                height: 200,
                width: 300,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: helper.getGenre(index1).length,
                  separatorBuilder: (context, _) => const SizedBox(width: 24),
                  itemBuilder: (BuildContext context, int index2) {
                    return SizedBox (
                      height: 200,
                      width: 300,
                      child: Center (
                        child: Card (
                          margin: const EdgeInsets.all(8.0),
                          elevation: 5,
                          child: ListTile(
                            title: Text(helper.getMovieTitle(index1, index2)),
                            onTap: () {
                              displayImage(context, index1, index2, helper.getMovieTitle(index1, index2));
                            },
                            onLongPress: () async {
                              var selected = await showMenu(
                                context: context,
                                position: const RelativeRect.fromLTRB(0, 0, 0, 0),
                                items: [
                                  const PopupMenuItem(value: 0,child: Text("Movie Info"),),
                                  const PopupMenuItem(value: 1,child: Text("Wikipedia Page"),),
                                  const PopupMenuItem(value: 2,child: Text("IMDB Page"),)
                                ],
                                elevation: 5.0,
                              );
                              switch(selected) {
                                case 0:
                                  print("movie info");
                                  break;
                                case 1:
                                  _launchWikiURL(index1, index2);
                                  break;
                                case 2:
                                  _launchIMDBURL(index1, index2);
                              }
                            },
                            leading: Image(image: AssetImage(helper.getGenre(index1).elementAt(index2))),
                          )
                        ),
                      ),
                    );
                  }
                ),
              ),
            ]
          ),
        ),
      );
    }
    return widgetList;
  }

  _launchWikiURL(int index1, int index2) async {
    var url = helper.getMovieWiki(index1, index2);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch the url';
    }
  }

  _launchIMDBURL(int index1, int index2) async {
    var url = helper.getMovieIMDB(index1, index2);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch the url';
    }
  }

  void displayImage(BuildContext ctx, int index1, int index2, String title){
    // Different method of switching to another page and passing information so it can return a widget
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_){
          return DisplayImages(index1, index2, title, helper);
        },
        )
    );
  }
}
