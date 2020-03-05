import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:insta/http/webclient.dart';
import 'package:insta/post.dart';
import 'package:insta/story.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  FindAll findAll = new FindAll();
}

class _HomePageState extends State<HomePage> {

//  Future<Post> futurePost;
//
//  @override
//  void initState() {
//    super.initState();
//    futurePost = getPosts();
//  }

  List<Post> listaPost = new List<Post>();

  void initState() async {
    super.initState();
    widget.findAll.getPosts();
  }


//  int currentPage = 0;

  List<Story> _stories = [
    Story(
        "https://images.pexels.com/photos/276064/pexels-photo-276064.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        "Nome"),
    Story(
        "https://images.pexels.com/photos/35612/people-homeless-male-street.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Nome"),
    Story(
        "https://images.pexels.com/photos/1559193/pexels-photo-1559193.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        "Nome"),
    Story(
        "https://images.pexels.com/photos/764529/pexels-photo-764529.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Nome"),
    Story(
        "https://images.pexels.com/photos/733500/pexels-photo-733500.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Nome"),
    Story(
        "https://images.pexels.com/photos/1081685/pexels-photo-1081685.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Nome"),
    Story(
        "https://images.pexels.com/photos/247206/pexels-photo-247206.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Nome"),
    Story(
        "https://images.pexels.com/photos/247206/pexels-photo-247206.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Nome"),
    Story(
        "https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        "Nome"),
  ];

  List<Post> posts = [
    Post(
        username: "Guilherme",
        userImage:
            "https://s3.amazonaws.com/uifaces/faces/twitter/felipecsl/128.jpg",
        postImage:
            "https://images.pexels.com/photos/302769/pexels-photo-302769.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        caption: "Consequatur nihil aliquid omnis consequatur."),
  ];

  @override
  Widget build(BuildContext context) {
    //barra superior
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEEEEEE),
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          "Instagram",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Feather.camera,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesome.send_o,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Divider(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _stories.map((story) {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(68),
                              border: Border.all(
                                width: 3,
                                color: Color(0xFF8E44ad),
                              )),
                          child: Container(
                            padding: EdgeInsets.all(2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(68),
                              child: Image(
                                image: NetworkImage(story.image),
                                width: 68,
                                height: 68,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(story.name)
                      ],
                    );
                  }).toList(),
                ),
              ),

              //inicio do feed
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: posts.length,
                  itemBuilder: (ctx, i) {
                    //imagem do usuario em cima do perfil
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          //primeira linha da foto no feed
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image(
                                        image: NetworkImage(posts[i].userImage),
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(posts[i].username)
                                  ],
                                ),

                                IconButton(
                                    icon: Icon(SimpleLineIcons.options),
                                    onPressed: (){}
                                )

                              ],
                            ),
                          ),
                          //final da linha da foto no feed

                          //a foto do feed
                          Image(
                            image: NetworkImage(posts[i].postImage),
                            width: MediaQuery.of(context).size.width,
                          ),

                          //linha dos icones
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Row(
                                children: <Widget>[
                                  IconButton(
                                    onPressed: (){},
                                    icon: Icon(FontAwesome.heart_o),
                                  ),

                                  IconButton(
                                    onPressed: (){},
                                    icon: Icon(FontAwesome.comment_o),
                                  ),

                                  IconButton(
                                    onPressed: (){},
                                    icon: Icon(FontAwesome.send_o),
                                  ),

                                ],
                              ),

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: RichText(
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "Curtido por",
                                            style: TextStyle(
                                                color: Colors.black
                                            )
                                        ),

                                        TextSpan(
                                            text: "70 pessoas",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                            )
                                        ),

                                      ]
                                  ),
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
