import 'package:flutter/material.dart';
import 'package:letschat/pages/chat_page.dart';


class MainPage extends StatefulWidget {
  static String id = 'main_page';
  @override
  _MainPageState createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{

  TabController _tabController;
  final _controller = ScrollController();

  @override
  void initState(){
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController.index = _index;
    _tabController.addListener(() {
      setState(() {
        _index = _tabController.index;
      });
    }
    );
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  List<String> names = ['Idris', 'Adam', 'Segun', 'Rofiat', 'Rokibat', 'Sulaimon', 'Precious', 'Muriziq', 'Basit', 'Rodiyat',
  'Umm Anni', 'Yunus', 'Toheeb', 'Ibrahim', 'Bro Moshood'];

  List<Widget> myTabs =[
    Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Icon(Icons.camera_alt),
        )),
    Text('CHATS',
      style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold
      ),),
    Text('STATUS',
      style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold
      ),),
    Text('CALLS',
      style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold
      ),)
  ];

  String date = '24/10/2020';
  String greeting = 'I believe I can fly';
  int _index = 1;

  Column getColumn(){
    List<Column> columnList = [];
    for(var i in names){
     Column newColumn = Column(
       mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFECEFF1),
              radius: 30,
              child: Icon(Icons.perm_identity, size: 30, color: Colors.white,),
            ),
            title: Text(i,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            subtitle: Text('Just now', style: TextStyle(color: Color(0xFF757575), fontSize: 15),),

          ),
          Divider(
            indent: 90,
            color: Color(0xFFE0E0E0),
          )
        ],
      );
     columnList.add(newColumn);
    }
    return Column(
      children: columnList,
    );
  }


  // ignore: missing_return
  Widget getFAB(){
    if(_index == 1){
      return FloatingActionButton(
        backgroundColor: Color(0xFF00CC3F),
        child: Icon(Icons.chat, color: Colors.white,),
          onPressed: null);
    }else if(_index == 2){
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: true,
            onPressed: (){},
            elevation: 2,
            backgroundColor:  Colors.white,
            child: Icon(Icons.create, color: Color(0xFF546e7A),),
          ),
          FloatingActionButton(
            onPressed: (){},
            backgroundColor:  Color(0xFF00CC3F),
            child: Icon(Icons.photo_camera, color: Colors.white,),
          ),
        ],
      );
    }else if(_index == 3){
      return FloatingActionButton(
        child: CircleAvatar(
          radius: 30,
          backgroundColor:  Color(0xFF00CC3F),
          child: Icon(Icons.call, color: Colors.white,),
        ),
          onPressed: null);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF075E54),
      child: Scaffold(
        floatingActionButton: getFAB(),
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                    backgroundColor: Color(0xFF075E54),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.search),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.more_vert),
                      )
                    ],
                    title: Text('WhatsApp',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                    pinned: true,
                    floating: true,

                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      onTap: (index){
                        setState(() {
                          _index = index;
                        });
                      },
                      controller: _tabController,
                        indicatorColor: Colors.white,
                        labelPadding: EdgeInsets.only(bottom: 10),
                        tabs: myTabs)
                ),
//              color: Colors.white,
              ];
            },
            body: Container(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Center(child: Text('Camera'),),
                  ChatsTab(names: names, greeting: greeting, date: date),
                  SingleChildScrollView(
                    child: Container(
                        child: Column(
                          children: [
                            ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color(0xFFECEFF1),
                                  radius: 30,
                                  child: Icon(Icons.perm_identity, size: 30, color: Colors.white,),
                                ),
                                title: Text('My status',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                subtitle: Text('Today, 15:00', style: TextStyle(color: Color(0xFF757575), fontSize: 15),),
                                trailing: Icon(Icons.more_horiz, color: Color(0xFF00897B),)
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 5, left: 10),
                                color: Color(0xFFF5F5F5),
                                width: double.infinity,
                                height: 30,
                                child: Text('Recent updates',
                                  style: TextStyle(
                                      color: Color(0xFF757575),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),)),

                            getColumn(),
                          ],
                        )
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      controller: _controller,
                      itemCount: names.length,
                      itemBuilder: (context, index){
                        return Column(
                          children: [
                            ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Color(0xFFECEFF1),
                                  radius: 30,
                                  child: Icon(Icons.perm_identity, size: 30, color: Colors.white,),
                                ),
                                title: Text(names[index],
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                subtitle: Row(
                                  children: [
                                    Icon(Icons.call_made, color: Color(0xFF00D369), size: 15,),
                                    SizedBox(width: 5,),
                                    Text('19 October, 14:01', style: TextStyle(color: Color(0xFF757575), fontSize: 15),),
                                  ],
                                ),
                                trailing: Icon(Icons.call, color: Color(0xFF00897B), size: 25,)
                            ),
                            Divider(
                              color: Color(0xFFE0E0E0),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class ChatsTab extends StatelessWidget {
  const ChatsTab({
    Key key,
    @required this.names,
    @required this.greeting,
    @required this.date,
  }) : super(key: key);

  final List<String> names;
  final String greeting;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index){
          return Column(
            children: [
              ListTile(
                onTap: (){
                  Navigator.pushNamed(context, ChatPage.id);
                },
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFECEFF1),
                  radius: 30,
                  child: Icon(Icons.perm_identity, size: 30, color: Colors.white,),
                ),
                title: Text(names[index],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                subtitle: Text(greeting, style: TextStyle(color: Color(0xFF757575), fontSize: 15),),
                trailing: Text(date, style: TextStyle(
                  color: Color(0xFF757575),
                fontSize: 12),),
              ),
              Divider(
                indent: 90,
                color: Color(0xFFE0E0E0),
              )
            ],
          );
        },
      ),
    );
  }
}
