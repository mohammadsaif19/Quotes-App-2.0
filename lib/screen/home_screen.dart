import 'package:flutter/material.dart';
import '../model/quotes_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/quotes.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List title = [
      "উপদেশ মূলক উক্তি ",
      "হৃদয় স্পর্শ মূলক উক্তি",
      "অনুপ্রেরণা মূলক উক্তি",
      "ভালোবাসা নিয়ে উক্তি",
      "দুঃখ নিয়ে উক্তি",
      "জীবনীমূলক উক্তি",
      "বাণী চিরন্তণী",
      "কবিতামূলক উক্তি",
      "মজার জোকস",
      "শুভেচ্ছা মূলক উক্তি"
    ];

    List quotesData = [
      motivational,
      heartTouching,
      biography,
      love,
      sad,
      aboutLife,
      educational,
      poem,
      jokes,
      wishes
    ];

    List circleAvator = [
      "🙂",
      "🖤",
      "📚 ",
      "💕",
      "😢",
      "👨‍👩‍👦‍👦",
      "📖",
      "📝",
      "😂",
      "😍 "
    ];

    Future<bool> _onBackPressed() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  "আপনি কি সত্যিই “বাংলা উক্তি ও বাণী” অ্যাপ থেকে বাহির হতে চান ?",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Galada',
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("না"),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  FlatButton(
                    child: Text("হ্যাঁ"),
                    onPressed: () => Navigator.pop(context, true),
                  )
                ],
              ));
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "বাংলা উক্তি ও বাণী",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Galada'),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                child: DrawerHeader(
                  child: CircleAvatar(
                    child: Text(
                      "বাংলা উক্তি ও বাণী",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Galada'),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Rate Our Apps",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      letterSpacing: 1.5,
                      fontFamily: 'Galada',
                      fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.sentiment_very_satisfied,
                    size: 23, color: Colors.teal),
                onTap: () async {
                  var url =
                      'https://play.google.com/store/apps/details?id=com.mohammadsaif.bangla_quotes';
                  if (await canLaunch(url)) {
                    await launch(
                      url,
                      forceSafariVC: false,
                      forceWebView: false,
                      headers: <String, String>{
                        'Rate Our Apps': 'Rate Our Apps'
                      },
                    );
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              ListTile(
                title: Text(
                  "Enjoy our more Apps",
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 18,
                      letterSpacing: 1.5,
                      fontFamily: 'Galada',
                      fontWeight: FontWeight.w500),
                ),
                leading:
                    Icon(Icons.phone_android, size: 23, color: Colors.indigo),
                onTap: () async {
                  var url =
                      'https://play.google.com/store/apps/developer?id=RA+Soft+Solution';
                  if (await canLaunch(url)) {
                    await launch(
                      url,
                      forceSafariVC: false,
                      forceWebView: false,
                      headers: <String, String>{
                        'Rate Our Apps': 'Rate Our Apps'
                      },
                    );
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              Divider(
                color: Colors.teal,
              )
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: title.length,
          itemBuilder: (BuildContext contex, int index) => Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuotesDetailsScreen(
                              quotes: quotesData[index],
                              quotesTitle: title[index],
                            )));
              },
              child: Card(
                  child: Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10.0)),
                    CircleAvatar(
                      child: Text(circleAvator[index]),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    Text(
                      title[index],
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Galada'),
                    ),
                  ],
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
