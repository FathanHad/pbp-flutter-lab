import 'package:flutter/material.dart';
import 'package:counter_7/pages/mywatchlist_page.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:google_fonts/google_fonts.dart';


class MyWatchListDetails extends StatefulWidget {
    const MyWatchListDetails({Key? key}) : super(key: key);

    @override
    State<MyWatchListDetails> createState() => MyWatchListStateDetails();
}

class MyWatchListStateDetails extends State<MyWatchListDetails> {
    Fields currentFields = Details.test;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List Details'),
        ),
        body: Column(
          children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:Align(
                      alignment: Alignment.center,
                      child: Column(
                          children: <Widget>[
                            Text(
                              currentFields.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold, 
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Release Date: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: currentFields.releaseDate),
                          ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Rating: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: currentFields.rating.toString()),
                          ]
                        ),
                      ),
                    ),
                    if(currentFields.isWatched == "sudah")...[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          textAlign: TextAlign.start,
                          text:  TextSpan(
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Status: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text:'Sudah Ditonton', style: GoogleFonts.pridi()),
                            ]
                          ),
                        ),
                      ),
                    ]
                    else...[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          textAlign: TextAlign.start,
                          text:  TextSpan(
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          children: <TextSpan>[
                            const TextSpan(
                            text: 'Status: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'Belum Ditonton', style: GoogleFonts.pridi()),
                          ]
                        ),
                      ),
                    ),
                  ],
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Review: ", 
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      currentFields.review,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ]
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [TextButton(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () { 
                    Navigator.pop(context);
                  },
                  child: const Text('Back'),
                ),
              ],
              ),
            ),
          ],
        ),
      );
    }
}