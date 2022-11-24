import 'package:counter_7/drawer.dart';
import 'package:counter_7/model/mywatchlistData.dart';
import 'package:counter_7/page/watchlistDetail.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyWatchlist extends StatefulWidget {
    const MyWatchlist({Key? key}) : super(key: key);

    @override
    _MyWatchlistState createState() => _MyWatchlistState();
}

class _MyWatchlistState extends State<MyWatchlist> {

  static List<Watchlist> _listOfMyWatchlists = [];
  static bool _hasFetched = true;

  Future<List<Watchlist>> fetchWatchlist() async {
      var url = Uri.parse('https://tugas-2-pbp-wedens.herokuapp.com/mywatchlist/json/');
      print(url);
      var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
      );

      // melakukan decode response menjadi bentuk json
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      // melakukan konversi data json menjadi object Watchlist
      List<Watchlist> watchlist = [];
      for (var d in data) {
        if (d != null) {
            watchlist.add(Watchlist.fromJson(d));
        }
      }

      return watchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('My Watchlist'),
        ),
        drawer: const PageDrawer(),
        body: FutureBuilder(
            future: fetchWatchlist(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
                } 
                else {
                  if (!snapshot.hasData) {
                      return Column(
                        children: const [
                            Text(
                            "Tidak ada watch list :(",
                            style: TextStyle(
                              color: Color(0xff59A5D8),
                              fontSize: 20),
                            ),
                            SizedBox(height: 8),
                        ],
                      );
                  } else {
                    if (_hasFetched) {
                      _listOfMyWatchlists = snapshot.data!;
                      _hasFetched = false;
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyDetail(
                                    watchlistModel: _listOfMyWatchlists[index])),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: 
                                      _listOfMyWatchlists[index].fields.watched == Watched.NOT_YET
                                        ? Colors.red
                                        : Colors.green,
                                    blurRadius: 2.0
                                  )
                                ]
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text(
                                    "${snapshot.data![index].fields.title}",
                                    style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    ),
                                ),
                                const SizedBox(height: 10),
                                ],
                            ),
                          )
                        )
                    );
                  }
                  //return CircularProgressIndicator();
                }
            }
        )
    );
  }
}