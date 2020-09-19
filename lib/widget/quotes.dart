import 'package:flutter/material.dart';

class QuotesDetailsScreen extends StatefulWidget {
  final List quotes;
  final String quotesTitle;
  const QuotesDetailsScreen({Key key, this.quotes, this.quotesTitle})
      : super(key: key);
  static final String id = 'quotesScreen';

  @override
  _QuotesDetailsScreenState createState() => _QuotesDetailsScreenState();
}

class _QuotesDetailsScreenState extends State<QuotesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          widget.quotesTitle,
          style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w200,
              color: Colors.white,
              fontFamily: 'AmarBangla'),
        ),
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 5),
        child: Container(
            color: Colors.lime[50],
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: widget.quotes.length,
              itemBuilder: (BuildContext context, int index) => Container(
                padding: EdgeInsets.all(10.0),
                child: SelectableText(
                  widget.quotes[index],
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontFamily: 'Galada'),
                ),
              ),
            )),
      ),
    );
  }
}
