import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomSmallImage extends StatelessWidget {
  const CustomSmallImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  'https://i.pngimg.me/thumb/f/720/580450f9c74f4129a78b.jpg',
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                    );
  }
}