import 'package:counter_7/drawer/drawer.dart';
import 'package:counter_7/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({Key? key}) : super(key: key);

  @override
  _MyWatchListState createState() => _MyWatchListState();
}

class Details {
  static late Fields _test;
  static Fields get test => _test;
}

class _MyWatchListState extends State<MyWatchListPage> {
  Future<List<MyWatchList>> fetchMyWatchList() async {
    var url =
        Uri.parse('https://tugas2pbpfathan.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object MyWatchList
    List<MyWatchList> listMyWatchList = [];
    for (var d in data) {
      if (d != null) {
        listMyWatchList.add(MyWatchList.fromJson(d));
      }
    }

    return listMyWatchList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: Hamburger(),
        body: FutureBuilder(
            future: fetchMyWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Kamu belum Menonton Film :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  if (snapshot.data![index].fields.isWatched ==
                                      "sudah") ...[
                                    const BoxShadow(
                                        color: Colors.blue, blurRadius: 2.0),
                                  ] else ...[
                                    const BoxShadow(
                                        color: Colors.red, blurRadius: 2.0)
                                  ],
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Details._test =
                                        snapshot.data![index].fields;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyWatchListDetails()),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "${snapshot.data![index].fields.title}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}
