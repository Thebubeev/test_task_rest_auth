class Albums {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Albums({
    this.albumId,
    this.id,
    this.title,
    this.url, this.thumbnailUrl
  });

  factory Albums.fromJson(Map<String, dynamic> json) {
    return Albums(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
