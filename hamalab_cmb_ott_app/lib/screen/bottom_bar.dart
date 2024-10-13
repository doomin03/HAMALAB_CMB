import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final TabController tabController;

  BottomBar({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1,
            color: Colors.grey[400],
          ),
          Container(
            height: 92,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => tabController.index = 0,
                    child: Tab(
                      icon: Image.asset('images/icon/home.png', height: 23, width: 23),
                      child: Text("홈", style: TextStyle(fontSize: 9)),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => tabController.index = 1,
                    child: Tab(
                      icon: Image.asset('images/icon/category.png', height: 22, width: 23),
                      child: Text("카테고리", style: TextStyle(fontSize: 9)),
                    ),
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // 모달
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(0),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Icon(Icons.add, color: Colors.black, size: 20),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => tabController.index = 2,
                    child: Tab(
                      icon: Image.asset('images/icon/history.png', height: 23, width: 23),
                      child: Text("히스토리", style: TextStyle(fontSize: 9)),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => tabController.index = 3,
                    child: Tab(
                      icon: Image.asset('images/icon/User.png', height: 22, width: 23),
                      child: Text("마이", style: TextStyle(fontSize: 9)),
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
