// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'card.dart';

class GridViewBody extends StatefulWidget {
  const GridViewBody({super.key});

  @override
  State<GridViewBody> createState() => _GridViewBodyState();
}

class _GridViewBodyState extends State<GridViewBody>
    with AutomaticKeepAliveClientMixin {
  final logos = [
    'https://i.pngimg.me/thumb/f/720/580450f9c74f4129a78b.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAFQ7RWPG623plhmh1exqF6Rz2dm32YWPYjgunnIe6ujSIBdYl5UxbMWguXBFtwYaV2D4&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcX7TqtcAPW-ewPZXvp7iiCJyRr6v9YBbhBw&usqp=CAU',
    'https://i.pinimg.com/170x/d4/f5/e9/d4f5e922832e6e2346fd9634077dda8f.jpg',
    'https://i.pngimg.me/thumb/f/720/580450f9c74f4129a78b.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcX7TqtcAPW-ewPZXvp7iiCJyRr6v9YBbhBw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT73O3g9vLb3YOzARpfHm7dvsWfY9vV02mbnQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAFQ7RWPG623plhmh1exqF6Rz2dm32YWPYjgunnIe6ujSIBdYl5UxbMWguXBFtwYaV2D4&usqp=CAU',
  ];
  final names = [
    'سوبر ماركت',
    'فريش ماركت',
    'جملة ماركت',
    'ماركت',
    'جملة ماركت',
    'ماركت',
    'سوبر ماركت',
    'ماركت',
  ];
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: logos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.72,
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5),
        itemBuilder: (context, index) {
          return CustomCard(
            title: names[index],
            url: logos[index],
          );
        },
      ),
    );
  }
}
