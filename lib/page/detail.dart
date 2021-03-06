import 'package:flutter/material.dart';
import '../util/assets.dart';

class Detail extends StatefulWidget {
  final Map map;
  const Detail({Key? key, required this.map}) : super(key: key);


  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late var imageHeader = widget.map["image"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            setImageHeader(imageHeader),
            Positioned(
                child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ))
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -2), blurRadius: 6, color: Colors.black12),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34),
            )),
        height: MediaQuery.of(context).size.height * 0.68,
        child: ListView(
            children: [
              Center(
                child: Container(
                  height: 5,
                  margin: const EdgeInsets.only(top: 16),
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black87,
                  ),
                ),
              ),
              course(),
            ],
        ),
      ),
    );
  }

  Widget course(){
    var assetCourse = Assets.courses.where((element) => element.type.contains(widget.map["title"])).toList();
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: assetCourse.length,
        padding: const EdgeInsets.all(24),
        itemBuilder: (context, index) {
          var course = assetCourse[index];
          return  GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Click button play ${course.name}"),
              ));
            },
            child : Container(
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
                        onTap: () {
                          setState((){
                            imageHeader = course.image;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Play Course${course.name}"),
                          ));
                        },
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
            )
          );
        });
  }

  Widget setImageHeader(imageHeader){
    return Image.asset(
      imageHeader,
      fit: BoxFit.cover,
      height: 300,
      width: MediaQuery.of(context).size.width,
    );
  }

}
