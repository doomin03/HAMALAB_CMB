import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../model/data_model.dart';

class Main_slider extends StatefulWidget {
  @override
  _Main_slider createState() => _Main_slider();
}

class _Main_slider extends State<Main_slider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  List<String> imageList = [
    "images/poster/poster_01.png",
    "images/poster/poster_01.png",
    "images/poster/poster_01.png",
    "images/poster/poster_01.png",
    "images/poster/poster_01.png",
    "images/poster/poster_01.png",
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        // CarouselSlider 위젯
        CarouselSlider(
          items: imageList.map((url) => buildImage(url, screenWidth)).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: 250.0,
            viewportFraction: 1.0,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        // Dots Indicator
        SizedBox(height: 16.0),
        AnimatedSmoothIndicator(
          activeIndex: _current,
          count: imageList.length,
          effect: ScrollingDotsEffect(
            activeDotColor: Colors.black,
            dotColor: Colors.grey,
            dotHeight: 8.0,
            dotWidth: 8.0,
          ),
          onDotClicked: (index) {
            _controller.animateToPage(index);
          },
        ),
      ],
    );
  }

  Widget buildImage(String url, double screenWidth) {
    return Container(
      width: screenWidth, // 전달받은 screenWidth 사용
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover, // 이미지 비율 유지하며 화면 채우기
        ),
      ),
    );
  }
}

class VideoList extends StatefulWidget {
  final String title;

  VideoList({required this.title});

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  final List<Video> videos = [
    Video.fromMap({
      'title': '아침을 상쾌하게 시작하는',
      'imageUrl': 'images/poster/poster_02.png',
    }),
    Video.fromMap({
      'title': '코트 위의 테린이 서브 레슨',
      'imageUrl': 'images/poster/poster_03.png',
    }),
    Video.fromMap({
      'title': '피부에 좋은',
      'imageUrl': 'images/poster/poster_03.png',
    }),
    Video.fromMap({
      'title': '새로운 영상',
      'imageUrl': 'images/poster/poster_03.png',
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8.0),
        SizedBox(
          height: 97,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return buildImageCard(videos[index]);
            },
            padding: EdgeInsets.only(right: 50),
          ),
        ),
      ],
    );
  }

  Widget buildImageCard(Video video) {
    return Container(
      width: 143,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            width: 143,
            height: 97,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 0.1),
            ),
          ),
          Container(
            height: 77,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
            ),
            child: Image.asset(
              video.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 5,
            left: 5,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(7)),
              ),
              child: Text(
                video.title,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

