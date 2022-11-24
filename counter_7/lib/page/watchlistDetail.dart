import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlistData.dart';

class MyDetail extends StatefulWidget {
  const MyDetail({super.key, required this.watchlistModel});
  final Watchlist watchlistModel;
  @override
  State<MyDetail> createState() => _MyDetailState(watchlistModel);
}
class _MyDetailState extends State<MyDetail> {
  Watchlist model;
  _MyDetailState(this.model);
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
          title: const Text('Detail'),
      ),
      drawer: const PageDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
        child: Column(
          children: [
            Center(
              child: Text(
                widget.watchlistModel.fields.title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createRichText(
                    'Release Date',
                    widget.watchlistModel.fields.releaseDate.toString(),
                  ),
                  createRichText(
                    'Rating',
                    '${widget.watchlistModel.fields.rating}/5',
                  ),
                  createRichText(
                    'Status',
                    widget.watchlistModel.fields.watched.toString()
                  ),
                  const Text(
                    'Review',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.watchlistModel.fields.review,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  RichText createRichText(String firstString, String secondString) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$firstString: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: secondString,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}