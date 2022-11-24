import 'package:counter_7/main.dart';
import 'package:counter_7/page/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/data.dart';

class PageDrawer extends StatelessWidget {
  const PageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage(title: 'counter_7')),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              // Route menu ke halaman form tambah
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // Route menu ke halaman data
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DataPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Watchlist'),
            onTap: () {
              // Route menu ke halaman data
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyWatchlist()),
              );
            },
          ),
        ],
      ),
    );
  }
}
