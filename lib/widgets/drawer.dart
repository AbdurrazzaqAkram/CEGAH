import 'package:cegah_tim1/screens/cegah_bosan.dart';
import 'package:cegah_tim1/screens/tips_mencegah.dart';
import 'package:cegah_tim1/screens/wajib_baca.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color> [
                    Color(0xFF274684),
                    Colors.white,
                  ],
                ),
              ),
              child: Container(
                child: Column(
                  children: [
                    Material(
                      elevation: 10,
                      child: Image.asset('assets/images/CEGAH_Splash_Logo.png', width: 125, height: 125,),
                    )
                  ],
                ),
              ),
            ),
            Sidebar()
          ]
      )
    );
  }
}

class Sidebar extends StatefulWidget {

  List<_Item> items;
  _Item _current;

  @override
  State<StatefulWidget> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {

  @override
  void initState() {
    super.initState();

    widget.items = [
      _Item(
        icon: Icons.subject,
        title: 'Cegah Bosan',
        nav: () => Navigator.pop(context, MaterialPageRoute(builder: (context){
          return CegahBosan();
        })),
      ),
      _Item(
        icon: Icons.announcement_outlined,
        title: 'Wajib Baca',
        nav: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WajibBaca();
        }))
      ),
      _Item(
        icon: Icons.clean_hands_outlined,
        title: 'Tips Mencegah',
        nav: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TipsMencegah();
        }))
      ),
      _Item(
        icon: Icons.logout,
        title: 'Keluar Aplikasi',
        nav: SystemNavigator.pop
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) => ListTile(
        key: ObjectKey(widget.items[index]),
        title: Text(widget.items[index].title),
        leading: Icon(widget.items[index].icon),
        selected: widget._current == widget.items[index],
        selectedTileColor: Color(0xFF274684),
        onTap: () {
          widget.items[index].nav();
          setState(() => widget._current = widget.items[index]);
        },
      ),
      shrinkWrap: true,
    );
  }
}

class _Item {
  IconData icon;
  String title;
  Function nav;

  _Item({ this.icon, this.title, this.nav });
}