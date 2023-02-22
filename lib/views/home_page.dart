import 'package:api_integration_demo/Models/post.dart';
import 'package:api_integration_demo/main.dart';
import 'package:api_integration_demo/services/remote_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Posts>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('Items',style: TextStyle(color: Colors.white),)),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.black,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      bottom: BorderSide(color: Colors.black, width: 1),
                      right: BorderSide(color: Colors.black, width: 1),
                      left: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  child: Card(
                    elevation: 1,
                    shape: Border.fromBorderSide(),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  posts![index].title,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  posts![index].description ?? '',
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(8)),
                                  height: 20,
                                  width:
                                      MediaQuery.of(context).size.width * .14,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          posts![index].price.toString() ?? '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text(
                                        ' \$',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
