
import 'package:video_player/video_player.dart';

String videoPlayDuration(VideoPlayerValue videoPlayer) {
  Duration positionDuration = Duration(milliseconds: videoPlayer.position.inMilliseconds.round());
  String position = [positionDuration.inMinutes, positionDuration.inSeconds].map((seg) => seg.remainder(60).toString().padLeft(2, '0')).join(':');
  Duration duration = Duration(milliseconds: videoPlayer.duration.inMilliseconds.round());
  String totalDuration = [duration.inMinutes, duration.inSeconds].map((seg) => seg.remainder(60).toString().padLeft(2, '0')).join(':');
  return "$position / $totalDuration";
}