import 'package:flutter/material.dart';

// import '../models/exam.dart';
import '../screen/category_item.dart';
import '../dummy_data.dart';

class Categories extends StatelessWidget {
  static const routeName = '/examStart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Portal'),
      ),
      body: FutureBuilder(
        future: ApiService.getExam(),
        builder: (context, snapshot) {
          final examData = snapshot.data;

          if (snapshot.connectionState == ConnectionState.done) {
            return GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: examData['tests'].length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  examData['tests'][index]['name'],
                  examData['tests'][index],
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
