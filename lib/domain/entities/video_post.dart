class VideoPost {
  VideoPost({
    required this.caption,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
    required this.isFavorite,
  });

  final String caption;
  final String videoUrl;
  final int likes;
  final int views;
  final bool isFavorite;
}
