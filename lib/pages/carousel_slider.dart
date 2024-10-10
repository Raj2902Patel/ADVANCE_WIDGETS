import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CarouselSliderPage extends StatefulWidget {
  const CarouselSliderPage({super.key});

  @override
  State<CarouselSliderPage> createState() => _CarouselSliderPageState();
}

class _CarouselSliderPageState extends State<CarouselSliderPage> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final bool _isPlaying = false;
  final GlobalKey<CarouselSliderState> _sliderKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Carousel Slider"),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: imgList.map((val) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10.0), // Rounding the borders
                  child: CachedNetworkImage(
                    imageUrl: val,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Center(
                      child: Lottie.asset('assets/images/loading.json',
                          height: 80, width: 100),
                    ), // Loading placeholder
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                    ), // Error widget
                  ),
                ),
              );
            }).toList(),
            carouselController: _carouselController,
            options: CarouselOptions(
                autoPlay: true,
                initialPage: 0,
                autoPlayInterval: const Duration(seconds: 2),
                // enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentIndex = index;
                  });
                }
                // scrollDirection: Axis.vertical,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          buildCarouselIndicator()
        ],
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          InkWell(
            onTap: () {
              _carouselController.animateToPage(i);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: i == _currentIndex ? 15 : 10,
              width: i == _currentIndex ? 30 : 10,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: i == _currentIndex ? Colors.blueGrey : Colors.grey,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
      ],
    );
  }
}
