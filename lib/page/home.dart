
import 'package:course_app/page/detail.dart';
import 'package:flutter/material.dart';

import '../util/assets.dart';

class Home extends StatelessWidget {
  final assetCourseType = Assets.courseType;
  final assetCourse = Assets.courses;
  final assetProf = Assets.professor;

  final headerName = "Maulidani Mahmud";
  final headerImage = Assets.imgAvatar;
  final courseBackendImage = Assets.imgBackend;
  final courseFrontendImage = Assets.imgFrontend;
  final courseBackendTitle = "Backend";
  final courseFrontendTitle = "Frontend";
  final courseBackendModul = 12;
  final courseFrontendModul = 8;

  Home({Key? key}) : super(key: key);

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
                gridCourseType(context),
                titleCourseOnProgress(
                    "Course on Progress (${assetCourse.length})", () {}),
                listCourseOnProgress(),
                titleCourseOnProgress("Professor", () {}),
                listProfessor(),
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
      decoration: const BoxDecoration(
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
                const Text(
                  "Hello,",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  name,
                  style: const TextStyle(
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
            const Expanded(
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
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
            )
          ],
        ),
      ),
    );
  }

  Widget gridCourseType(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: assetCourseType.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          Map courseType = Assets.courseType[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detail(map: courseType),
                ),
              );
            },
            child: itemGridCourseType(courseType["image"],
                courseType["title"], courseType["modul"]),
          );
        });
  }

  Widget itemGridCourseType(String image, String title, int modul) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
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
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "$modul Modul",
                style: const TextStyle(color: Colors.black38, fontSize: 14),
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
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          GestureDetector(
              onTap: () => function, child: const Icon(Icons.navigate_next))
        ],
      ),
    );
  }

  Widget listCourseOnProgress() {
    return ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: assetCourse.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var course = Assets.courses[index];
          return Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
            decoration: BoxDecoration(
              color: Colors.indigo,
              boxShadow: const [
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
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                        child: Text(
                          course.duration,
                          style: const TextStyle(
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
                      child: const Padding(
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

  Widget listProfessor() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 24),
      child: SizedBox(
        height: 120,
        child: ListView.builder(
            padding: const EdgeInsets.only(left: 24, top: 12, bottom: 12),
            itemCount: assetProf.length,
            scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var prof = Assets.professor.elementAt(index);
              return Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        color: Colors.black12),
                  ],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        prof,
                        fit: BoxFit.cover,
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
