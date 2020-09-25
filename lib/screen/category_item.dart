import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final test;
  final String title;
  final Color color = Colors.purple;

  CategoryItem(
    this.title,
    this.test,
  );
  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/category-meals',
      arguments: {
        'title': title,
        'tests': test,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 20,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
