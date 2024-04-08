import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  const VideoButtons({
    super.key,
    required this.video,
  });

  final VideoPost video;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes,
          iconData: Icons.favorite,
          iconColor: Colors.red,
          onPressed: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        _CustomIconButton(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(
          height: 20,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(
            value: 0,
            iconData: Icons.play_circle_outline_rounded,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor,
    onPressed,
  })  : color = iconColor ?? Colors.white,
        onFavoriteVideo = onPressed;

  final int value;
  final IconData iconData;
  final Color color;
  final VoidCallback? onFavoriteVideo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onFavoriteVideo,
          icon: Icon(
            iconData,
            color: color,
            size: 30,
          ),
        ),
        if (value > 0)
          Text(
            HumanFormats.humanReadbleNumber(value.toDouble()),
          ),
      ],
    );
  }
}
