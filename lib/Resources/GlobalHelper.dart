/*
 * Create this provider so other dart files can access it
 */
class GlobalHelper{
  List<String> images = [
    "assets/images/darkknight.jpg", "assets/images/inception.jpg", "assets/images/rotk.jpg",
  ];

  List<String> genres = [
    "action", "drama", "animation", "sci-fi", "thriller",
  ];

  List<String> action = [
    "assets/images/darkknight.jpg", "assets/images/inception.jpg", "assets/images/rotk.jpg",
  ];

  List<String> actionMovies = [
    "The Dark Knight", "Inception", "Lord of the Rings: Return of the King",
  ];

  List<String> actionIMDB = [
    "https://www.imdb.com/title/tt0468569/?ref_=fn_al_tt_1",
    "https://www.imdb.com/title/tt1375666/?ref_=nv_sr_srsg_0",
    "https://www.imdb.com/title/tt0167260/?ref_=fn_al_tt_1",
  ];

  List<String> actionWiki = [
    "https://en.wikipedia.org/wiki/The_Dark_Knight",
    "https://en.wikipedia.org/wiki/Inception",
    "https://en.wikipedia.org/wiki/The_Lord_of_the_Rings:_The_Return_of_the_King",
  ];

  List<String> drama = [
    "assets/images/fallenangels.jpg", "assets/images/whiplash.jpg", "assets/images/norwegianwood.jpg",
  ];

  List<String> dramaMovies = [
    "Fallen Angels", "Whiplash", "Norwegian Wood",
  ];

  List<String> dramaWiki = [
    "https://en.wikipedia.org/wiki/Fallen_Angels_(1995_film)",
    "https://en.wikipedia.org/wiki/Whiplash_(2014_film)",
    "https://en.wikipedia.org/wiki/Norwegian_Wood_(film)",
  ];

  List<String> dramaIMDB = [
    "https://www.imdb.com/title/tt0112913/?ref_=nv_sr_srsg_0",
    "https://www.imdb.com/title/tt2582802/?ref_=nv_sr_srsg_0",
    "https://www.imdb.com/title/tt1270842/?ref_=nv_sr_srsg_0",
  ];

  List<String> animation = [
    "assets/images/akira.jpg", "assets/images/spiderverse.jpg", "assets/images/spiritedaway.jpg",
  ];

  List<String> animationMovies = [
    "Akira", "Spider-Man: Into the Spider-Verse", "Spirited Away",
  ];

  List<String> animationIMDB = [
    "https://www.imdb.com/title/tt0094625/?ref_=fn_al_tt_1",
    "https://www.imdb.com/title/tt4633694/?ref_=nv_sr_srsg_0",
    "https://www.imdb.com/title/tt0245429/?ref_=nv_sr_srsg_0",
  ];

  List<String> animationWiki = [
    "https://en.wikipedia.org/wiki/Akira_(1988_film)",
    "https://en.wikipedia.org/wiki/Spider-Man:_Into_the_Spider-Verse",
    "https://en.wikipedia.org/wiki/Spirited_Away",
  ];

  List<String> scifi = [
    "assets/images/bttf.jpg", "assets/images/bladerunner.jpg", "assets/images/matrix.jpg",
  ];

  List<String> scifiMovies = [
    "Back to the Future", "Blade Runner 2049", "The Matrix",
  ];

  List<String> scifiWiki = [
    "https://en.wikipedia.org/wiki/Back_to_the_Future",
    "https://en.wikipedia.org/wiki/Blade_Runner_2049",
    "https://en.wikipedia.org/wiki/The_Matrix",
  ];

  List<String> scifiIMDB = [
    "https://www.imdb.com/title/tt0088763/?ref_=nv_sr_srsg_0",
    "https://www.imdb.com/title/tt1856101/?ref_=nv_sr_srsg_0",
    "https://www.imdb.com/title/tt0133093/?ref_=nv_sr_srsg_0",
  ];

  List<String> thriller = [
    "assets/images/parasite.jpg", "assets/images/fightclub.jpg", "assets/images/getout.jpg",
  ];

  List<String> thrillerMovies = [
    "Parasite", "Fight Club", "Get Out",
  ];

  List<String> thrillerIMDB = [
    "https://www.imdb.com/title/tt6751668/?ref_=nv_sr_srsg_0",
    "https://www.imdb.com/title/tt0137523/?ref_=nv_sr_srsg_0",
    "https://www.imdb.com/title/tt5052448/?ref_=nv_sr_srsg_0",
  ];

  List<String> thrillerWiki = [
    "https://en.wikipedia.org/wiki/Parasite_(2019_film)",
    "https://en.wikipedia.org/wiki/Fight_Club",
    "https://en.wikipedia.org/wiki/Get_Out",
  ];

  List<String> getImages(){
    return images;
  }

  List<String> getGenres(){
    return genres;
  }

  List<String> getGenre(int index){
    switch(index) {
      case 0: {
        return action;
      }
      case 1: {
        return drama;
      }
      case 2: {
        return animation;
      }
      case 3: {
        return scifi;
      }
      case 4: {
        return thriller;
      }
      default: {
        throw NullThrownError();
      }
    }
  }

  String getGenreName(int index){
    switch(index) {
      case 0: {
        return 'Action';
      }
      case 1: {
        return 'Drama';
      }
      case 2: {
        return 'Animation';
      }
      case 3: {
        return 'Sci-Fi';
      }
      case 4: {
        return 'Thriller';
      }
      default: {
        throw NullThrownError();
      }
    }
  }

  String getMovieTitle(int index1, int index2) {
    switch(index1) {
      case 0: {
        return actionMovies.elementAt(index2);
      }
      case 1: {
        return dramaMovies.elementAt(index2);
      }
      case 2: {
        return animationMovies.elementAt(index2);
      }
      case 3: {
        return scifiMovies.elementAt(index2);
      }
      case 4: {
        return thrillerMovies.elementAt(index2);
      }
      default: {
        throw NullThrownError();
      }
    }
  }

  String getMovieIMDB(int index1, int index2) {
    switch(index1) {
      case 0: {
        return actionIMDB.elementAt(index2);
      }
      case 1: {
        return dramaIMDB.elementAt(index2);
      }
      case 2: {
        return animationIMDB.elementAt(index2);
      }
      case 3: {
        return scifiIMDB.elementAt(index2);
      }
      case 4: {
        return thrillerIMDB.elementAt(index2);
      }
      default: {
        throw NullThrownError();
      }
    }
  }

  String getMovieWiki(int index1, int index2) {
    switch(index1) {
      case 0: {
        return actionWiki.elementAt(index2);
      }
      case 1: {
        return dramaWiki.elementAt(index2);
      }
      case 2: {
        return animationWiki.elementAt(index2);
      }
      case 3: {
        return scifiWiki.elementAt(index2);
      }
      case 4: {
        return thrillerWiki.elementAt(index2);
      }
      default: {
        throw NullThrownError();
      }
    }
  }

}