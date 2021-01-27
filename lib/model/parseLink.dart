class ParseLink{
  String downloadUrl;
  ParseLink(Map<String, dynamic> data) {
    downloadUrl = data['video']['download_url'];
  }
}