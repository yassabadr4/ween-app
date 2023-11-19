import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class NewOfferListView extends StatefulWidget {
  const NewOfferListView({
    Key? key,
    required this.images,
    this.autoplay = true,
  }) : super(key: key);

  final List images;
  final bool? autoplay;
  @override
  State<NewOfferListView> createState() => _NewOfferListViewState();
}

class _NewOfferListViewState extends State<NewOfferListView> {
  List<Widget> getImages() {
    List<Widget> tabs = [];

    for (int i = 0; i < widget.images.length; i++) {
      tabs.add(Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, bottom: 20, top: 8),
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.images[i],
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: getImages(),
        options: CarouselOptions(
          viewportFraction: 1,
          height: double.maxFinite,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
        ));
    // AnotherCarousel(
    //     autoplay: widget.autoplay!,
    //     boxFit: BoxFit.none,
    //    
    //     dotIncreasedColor: kPrimary,
    //     dotColor: Colors.black45,
    //     dotBgColor: Colors.transparent,
    //     indicatorBgPadding: 1,
    //     dotSize: 6,
    //     images: getImages());
  }
}
