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
          appBar: AppBar(
            title: Text("WhatsApp", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
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
          body: TabBarView(
              controller: tabController,
              children: [
                Icon(Icons.camera_alt),
                ChatList(),
                Text("STATUS SCREEN"),
                Text("CALL SCREEN"),
              ],
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
      return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return 
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.account_circle, size: 64)
                    ],
                  ),
                  Divider()
                ],
              );
        },
      );
    }
  }