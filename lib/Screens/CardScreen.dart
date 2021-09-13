import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int imgeId = 0;
  PageController _controller = PageController(
    initialPage: 0,
  );
  List<Topic> lst = [
    Topic(
        "Title One",
        "A long description is a way to provide long alternative text for non-text elements, such as images. Generally, alternative text exceeding 250 characters, which cannot be made more concise without making it less descriptive or meaningful, should have a long description. Examples of suitable use of long description are charts, graphs, maps, infographics, and other complex images Like alternative text, long description should be descriptive and meaningful. It should also include all text that is incorporated into the image. A long description should provide visually-impaired users with as much information as sighted users would understand from the image.",
        "https://images.unsplash.com/photo-1542296332-2e4473faf563?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bG9uZG9uJTIwYWlycG9ydHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"),
    Topic(
        "Title Two",
        "A long description is a way to provide long alternative text for non-text elements, such as images. Generally, alternative text exceeding 250 characters, which cannot be made more concise without making it less descriptive or meaningful, should have a long description. Examples of suitable use of long description are charts, graphs, maps, infographics, and other complex images Like alternative text, long description should be descriptive and meaningful. It should also include all text that is incorporated into the image. A long description should provide visually-impaired users with as much information as sighted users would understand from the image.",
        "https://www.jupiterhospital.com/uploadedfiles/gallery/1580474961_Pune%20Jupiter.jpg"),
    Topic(
        "Title three",
        "A long description is a way to provide long alternative text for non-text elements, such as images. Generally, alternative text exceeding 250 characters, which cannot be made more concise without making it less descriptive or meaningful, should have a long description. Examples of suitable use of long description are charts, graphs, maps, infographics, and other complex images Like alternative text, long description should be descriptive and meaningful. It should also include all text that is incorporated into the image. A long description should provide visually-impaired users with as much information as sighted users would understand from the image.",
        "https://images.indianexpress.com/2021/06/Welcomhotel-Tavleen-Chail_1200.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(lst[imgeId].img!),
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                  elevation: 8.0,
                  margin: EdgeInsets.only(left: 0.0, bottom: 20.0),
                  child: SizedBox(
                      height: height - height / 3,
                      width: width - 20,
                      child: PageView.builder(
                        onPageChanged: (index) {
                          print(index);
                          setState(() {
                            imgeId = index;
                          });
                        },
                        controller: _controller,
                        scrollDirection: Axis.vertical,
                        itemCount: lst.length,
                        itemBuilder: (context, position) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(lst[position].name!,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(lst[position].desc!,
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          );
                        },
                      ))),
            )
          ],
        ),
      ),
    ));
  }
}

class Topic {
  String? name;
  String? desc;
  String? img;

  Topic(this.name, this.desc, this.img);
}
