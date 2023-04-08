import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:newso/models/video.dart';

class VideoController extends GetxController {
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);

  List<Video> get videoList => _videoList.value;

  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(
        FirebaseFirestore.instance.collection('videos').snapshots().map((
            QuerySnapshot query) {
          List<Video> retVal = [];
          for (var element in query.docs) {
            retVal.add(
              Video.fromSnap(element)
            );
          }
          return retVal;
        }));
  }
}

