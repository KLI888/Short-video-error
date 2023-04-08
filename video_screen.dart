import 'package:flutter/material.dart';
import 'package:newso/controllers/video_controller.dart';
import 'package:get/get.dart';
import 'package:newso/views/widgets/VideoPlayerWidget.dart';
import 'package:newso/views/widgets/video_player_item.dart';

import 'package:flutter/material.dart';


class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key);

  final VideoController videoController = Get.put(VideoController());

  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 50,
      height: 40,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            child: Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  voiceProfile(String profilePhoto) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: Image(
        image: NetworkImage(profilePhoto),
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Obx(() {
            return PageView.builder(
                itemCount: videoController.videoList.length,
                controller: PageController(
                  initialPage: 0,
                  viewportFraction: 1,
                ),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final data = videoController.videoList[index];
                  print(data);
                  return Stack(
                    children: [
                      // VideoPlayerItem(videoUrl: videoController.videoList[index].videoUrl),
                      VideoPlayerWidget(videoUrl: data.videoUrl),
                      Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Expanded(
                              child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        buildProfile('data.profilePhoto'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'data.username',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'data.caption',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.music_note,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'data.songName',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                              Container(
                                width: 100,
                                height: 380,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.favorite,
                                            size: 35,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'data.likes.length.toString()',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.comment,
                                            size: 35,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'data.commentCount.toString()',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.reply,
                                            size: 35,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'Share',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    voiceProfile('data.profilePhoto')
                                  ],
                                ),
                              )
                            ],
                          ))
                        ],
                      )
                    ],
                  );
                });
          }
        ));
  }
}
