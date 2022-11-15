import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/drawer.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataState();
}

class _DataState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: const PageDrawer(),
      body: Center(
        child: ListView.builder(
          itemCount: budgetList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(7),
              child: Material(
                borderRadius: BorderRadius.circular(7),
                shadowColor: Colors.grey,
                elevation: 3,
                child: ListTile(
                  title: Text(budgetList[index].judul),
                  subtitle: Text(budgetList[index].nominal.toString()),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(budgetList[index].jenis),
                      Text(
                        budgetList[index].tanggal.toString().substring(0, 10), 
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        )
      ),
    );
  }
}