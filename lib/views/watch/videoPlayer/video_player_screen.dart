import 'package:flutter/material.dart';
import 'package:movies_app/controllers/movies_controller.dart';
import 'package:movies_app/views/watch/details.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    print(Provider.of<MoviesController>(context,listen: false).selectedMovieVideoModel!.results[0].key);
    videoPlayerController = YoutubePlayerController(
      params: const YoutubePlayerParams(
        color: 'Red',
        showControls: true,
        mute: false,
        enableCaption:true,
        showFullscreenButton: true
      ),
    );
    videoPlayerController.loadVideoById(
        videoId: Provider.of<MoviesController>(context,listen: false).selectedMovieVideoModel!.results[0].key,
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: YoutubePlayerScaffold(
        enableFullScreenOnVerticalDrag: false,
        controller: videoPlayerController,
        builder: (context, player) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  player,
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Details(movieDetailsModel: Provider.of<MoviesController>(context).selectedMovieDetailsModel!),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
