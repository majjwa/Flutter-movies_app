
class AppConstant{

  static const String baseUrl= "https://api.themoviedb.org/3";
  static const String apiKey="7c51949919649e5de3d2e5399e7a9b26";
  static const String nowPlaying="$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popular="$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRated="$baseUrl/movie/top_rated?api_key=$apiKey";
  static const String baseImageUrl="https://image.tmdb.org/t/p/w500";
  static String movieDeatils( int movieId)=>
      "$baseUrl/movie/$movieId?api_key=$apiKey";
  static String recommendation( int movieId)=>
      "$baseUrl/movie/$movieId/recommedations/?api_key=$apiKey";
   static String imageUrl(String path)=> '$baseImageUrl$path';


}