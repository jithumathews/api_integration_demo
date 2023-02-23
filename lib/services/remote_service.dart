import 'package:api_integration_demo/Models/post.dart';
import 'package:http/http.dart' as http;
class RemoteService
{
  Future<List<Posts>?> getPosts() async
  {
    var client = http.Client();

    var uri = Uri.parse("https://fakestoreapi.com/products");
    var response = await client.get(uri);
    if (response.statusCode == 200)
      {
        var json = response.body;
        return postsFromJson(json);
      }

    
  }
}