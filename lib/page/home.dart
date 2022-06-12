import 'package:flutter/material.dart';

import '../util/assets.dart';

class Home extends StatelessWidget {
  var assetCourse = Assets.courses;

  var headerName = "Maulidani Mahmud";
  var headerImage = Assets.imgAvatar;
  var courseBackendImage = Assets.imgBackend;
  var courseFrontendImage = Assets.imgFrontend;
  var courseBackendTitle = "Backend";
  var courseFrontendTitle = "Frontend";
  var courseBackendModul = 12;
  var courseFrontendModul = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          background(),
          SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                header(headerName, headerImage),
                searchBar(),
                gridCourseType(),
                titleCourseOnProgress("Course on Progress ${assetCourse.length}", (){}),
                listCourseOnProgress(),
                titleCourseOnProgress("Professor", (){}),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget background() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
    );
  }

  Widget header(String name, String image) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello,",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              headerImage,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search..",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.indigo),
                ),
              ),
            ),
            Container(
              width: 1,
              height: 30,
              color: Colors.indigo,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_down_rounded),
            )
          ],
        ),
      ),
    );
  }

  Widget gridCourseType() {
    return GridView.builder(
        padding: EdgeInsets.all(24),
        itemCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          if (index == 0) {
            return itemGridCourseType(courseBackendImage, courseBackendTitle,
                "$courseBackendModul Modul");
          } else {
            return itemGridCourseType(courseFrontendImage, courseFrontendTitle,
                "$courseFrontendModul Modul");
          }
        });
  }

  Widget itemGridCourseType(String image, String title, String subTitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 0), blurRadius: 10, color: Colors.black12),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                subTitle,
                style: TextStyle(color: Colors.black38, fontSize: 14),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget titleCourseOnProgress(String title, Function function) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          GestureDetector(onTap: () {}, child: Icon(Icons.navigate_next))
        ],
      ),
    );
  }

  Widget listCourseOnProgress() {
    return ListView.builder(
        padding: EdgeInsets.all(24),
        itemCount: assetCourse.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var course = Assets.courses[index];
          return Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
            decoration: BoxDecoration(
              color: Colors.indigo,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    color: Colors.black12),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      course.image,
                      fit: BoxFit.cover,
                      height: 70,
                      width: 70,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 6),
                        child: Text(
                          course.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                        child: Text(
                          course.duration,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Material(
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 32,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
