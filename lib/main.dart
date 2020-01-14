import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Home(),
    )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController tabController;
  IconData fabIcon;
  ScrollController scrollViewController = new ScrollController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4)
      ..addListener((){
        setState(() {
          switch(tabController.index) {
            case 0:
              break;
            case 1:
              fabIcon = Icons.message;
              break;
            case 2:
              fabIcon = Icons.camera_alt;
              break;
            case 3:
              fabIcon = Icons.add_call;
              break;
          }
        });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
          body: 
            NestedScrollView(
              controller: scrollViewController,
              headerSliverBuilder: (context, innerBoxIsScrolled){
                return <Widget>[
                  SliverAppBar(
                    title: Text("WhatsApp", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                    pinned: true,      
                    floating: true,
                    forceElevated: innerBoxIsScrolled,
                    backgroundColor: Color(0xff075E55),
                    actions: <Widget>[              
                        IconButton(
                          icon: Icon(Icons.search, size: 25),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert, size: 23),
                          onPressed: () {},
                        )
                    ],
                    bottom: 
                      TabBar(
                        controller: tabController,
                        tabs: [
                            Tab(icon: Icon(Icons.camera_alt)),
                            Tab(text: "CHATS"),
                            Tab(text: "STATUS"),
                            Tab(text: "CALLS"),
                        ],
                        indicatorColor: Colors.white,     
                      ),
                  ),
                ];
              },
              
            body: TabBarView(
                controller: tabController,
                children: [
                  Icon(Icons.camera_alt),
                  ChatList(),
                  Text("STATUS SCREEN"),
                  Text("CALL SCREEN"),
                ],
              ),
            ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(fabIcon),
            backgroundColor: Color(0xff06D25E),
          ),
        );
  }
}

class ChatList extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(bottom: 0),  
        child:
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return 
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.account_circle, size: 60)
                          ),
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: 
                                  Row(children: <Widget>[
                                    Text("Amor ♥", style: TextStyle(fontWeight: FontWeight.w500 ,fontSize: 18), textAlign: TextAlign.left,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 250),
                                      child: Text("10:50", style: TextStyle(color: Colors.grey, fontSize: 14))
                                    )
                                  ],)
                                
                              ),
                              
                              Padding(
                                padding: EdgeInsets.only(right: 220, top: 5),
                                child: Text("A ultima mensagem", style: TextStyle(color: Colors.grey, fontSize: 15),)
                              ),

                              
                            ],
                          )
                        ],
                      ),
                      Divider()
                    ],
                  );
            },
          )
      );
    }
  }