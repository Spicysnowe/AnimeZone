const String getRecomendations= r'''
query Page($page: Int, $perPage: Int, $ratingGreater: Int) {
  Page(page: $page, perPage: $perPage) {
    recommendations(rating_greater: $ratingGreater) {
      media {
        title {
          english
        }
        coverImage {
          medium
        }
      }
    }
  }
}
''';