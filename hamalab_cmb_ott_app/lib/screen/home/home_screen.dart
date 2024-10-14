import 'package:flutter/material.dart';
import 'package:hamalab_cmb_ott_app/screen/home/context.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Image.asset('images/logo/logo.png'),
            margin: EdgeInsets.fromLTRB(19, 39, 0, 0),
          ),
          actions: [
            IconButton(
              icon: Image.asset(
                "images/icon/Notification.png",
                width: 28,
                height: 28,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "images/icon/Search.png",
                width: 28,
                height: 28,
              ),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.white, // 배경 색상 설정
          iconTheme: IconThemeData(color: Colors.black), // 아이콘 색상
        ),
        body: DefaultTabController(
          length: 5,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(text: '나의 레인보우'),
                    Tab(text: 'LIVE'),
                    Tab(text: 'VOD'),
                    Tab(text: '클래스'),
                    Tab(text: '클리닉'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Main_slider(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey
                          ),
                          margin: EdgeInsets.fromLTRB(24, 10, 24, 0),
                          child: SizedBox(
                            height: 71,
                            child: Center(
                              child: Text("광고 배너"),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        VideoList(title: "{이름} 님이 시청 중인 콘텐츠"),
                        VideoList(title: "{이름} 님이 시청 중인 콘텐츠"),
                        GameList(title: "레인보우 게임",),
                        People(title: "동네사람들",)
                      ],
                    ),
                    Live(),
                    ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Main_slider(),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey
                          ),
                          margin: EdgeInsets.fromLTRB(24, 10, 24, 0),
                          child: SizedBox(
                            height: 71,
                            child: Center(
                              child: Text("광고 배너"),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        VideoList(title: "{이름} 님이 시청 중인 콘텐츠"),
                        VideoList(title: "{이름} 님이 시청 중인 콘텐츠"),
                        GameList(title: "레인보우 게임",),
                        People(title: "동네사람들",)
                      ],
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Main_slider(),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey
                          ),
                          margin: EdgeInsets.fromLTRB(24, 10, 24, 0),
                          child: SizedBox(
                            height: 71,
                            child: Center(
                              child: Text("광고 배너"),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        VideoList(title: "{이름} 님이 시청 중인 콘텐츠"),
                        VideoList(title: "{이름} 님이 시청 중인 콘텐츠"),
                        GameList(title: "레인보우 게임",),
                        People(title: "동네사람들",)
                      ],
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Main_slider(),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey
                          ),
                          margin: EdgeInsets.fromLTRB(24, 10, 24, 0),
                          child: SizedBox(
                            height: 71,
                            child: Center(
                              child: Text("광고 배너"),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        VideoList(title: "{이름} 님이 시청 중인 콘텐츠"),
                        VideoList(title: "{이름} 님이 시청 중인 콘텐츠"),
                        GameList(title: "레인보우 게임",),
                        People(title: "동네사람들",)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
