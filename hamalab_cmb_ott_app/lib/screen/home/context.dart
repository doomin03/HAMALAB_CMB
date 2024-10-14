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
      width: screenWidth,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.cover,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              IconButton(onPressed: (){}, icon: Text(">", style: TextStyle(fontSize: 20),))
            ],
          )
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


class GameList extends StatefulWidget {
  final String title;

  GameList({required this.title});

  @override
  _GameListState  createState() => _GameListState ();
}

class _GameListState  extends State<GameList> {
  final List<Game> games = [
    Game.fromMap({
      'title': '레인보우 고스톱',
      'imageUrl': 'images/logo/game0.png',
    }),
    Game.fromMap({
      'title': '레인보우 고스톱',
      'imageUrl': 'images/logo/game0.png',
    }),
    Game.fromMap({
      'title': '레인보우 고스톱',
      'imageUrl': 'images/logo/game0.png',
    }),
    Game.fromMap({
      'title': '레인보우 고스톱',
      'imageUrl': 'images/logo/game0.png',
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                IconButton(onPressed: (){}, icon: Text(">", style: TextStyle(fontSize: 20),))
              ],
            )
        ),
        SizedBox(height: 8.0),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: games.length,
            itemBuilder: (context, index) {
              return buildImageCard(games[index]);
            },
            padding: EdgeInsets.only(right: 50),
          ),
        ),
      ],
    );
  }

  Widget buildImageCard(Game video) {
    return Container(
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 0.1),
            ),
          ),
          Container(
            height: 76,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
            ),
            child: Image.asset(
              video.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 1,
            left: 5,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(7)),
              ),
              child: Text(
                video.title,
                style: TextStyle(
                  fontSize: 8,
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


class People extends StatefulWidget {
  final String title;

  People({required this.title});

  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  final List<Video> videos = [
    Video.fromMap({
      'title': '현관 초인종에 이것 붙인',
      'imageUrl': 'images/poster/poster_05.png',
    }),
    Video.fromMap({
      'title': '현관 초인종에 이것 붙인',
      'imageUrl': 'images/poster/poster_06.png',
    }),
    Video.fromMap({
      'title': '현관 초인종에 이것 붙인',
      'imageUrl': 'images/poster/poster_06.png',
    }),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Text(">", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return buildImageCard(videos[index]);
            },
            // Padding 최소화
            padding: const EdgeInsets.only(right: 20),
          ),
        ),
      ],
    );
  }

  Widget buildImageCard(Video video) {
    return Container(
      width: 160, // 카드의 너비 조정
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
        children: [
          // 이미지 컨테이너
          Container(
            width: 160,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Colors.black, width: 0.1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(
                video.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 텍스트 배치
          Positioned(
            bottom: 5,
            left: 5,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(7),
                ),
              ),
              child: Text(
                video.title,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
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





class Live extends StatefulWidget {
  @override
  _LiveState createState() => _LiveState();
}

class _LiveState extends State<Live> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Fixed image area (339x175)
          Container(
            width: 339,
            height: 175,
            color: Colors.grey,
            child: Center(
              child: Text(
                '이미지 영역',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 16),

          // Custom tab bar with | separators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: Text(
                  'FAST',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedIndex == 0 ? Colors.black : Colors.grey,
                  ),
                ),
              ),
              Text('  |  ', style: TextStyle(color: Colors.grey)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: Text(
                  '실시간',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedIndex == 1 ? Colors.black : Colors.grey,
                  ),
                ),
              ),
              Text('  |  ', style: TextStyle(color: Colors.grey)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                child: Text(
                  '유료채널',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: selectedIndex == 2 ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Tab view area
          Expanded(
            child: selectedIndex == 0
                ? Container(
              color: Colors.blue[50],
              child: Center(
                child: Text(
                  'FAST 컨텐츠',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            )
                : selectedIndex == 1
                ? Container(
              color: Colors.green[50],
              child: Center(
                child: Text(
                  '실시간 컨텐츠',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            )
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '구독중인 채널이 없습니다.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  '다양한 채널이 준비되어 있으니 구독 후 이용해주세요!',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Button action (if any) goes here
                  },
                  child: Text('상품 보러가기'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button background color
                    foregroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
