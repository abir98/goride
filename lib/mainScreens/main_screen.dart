import'package:flutter/material.dart';
import 'package:goride/tabPages/history_tab.dart';
import 'package:goride/tabPages/home_tab.dart';
import 'package:goride/tabPages/profile_tab.dart';
import 'package:goride/tabPages/ride_tab.dart';

class MainScreen extends StatefulWidget {



  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin
{

  TabController?  tabController ;
  int selectedIndex =0;

  onItemClicked(int index){

    setState(() {
      selectedIndex = index;
       tabController!.index=selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4,vsync:this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics:const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [ hometabpage(),
          ridetabpage(),
          historytabpage(),
          profiletabpage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon:Icon(Icons.home),
          label: "Home"),

          BottomNavigationBarItem(icon:Icon(Icons.car_crash),
              label: "Rides"),

          BottomNavigationBarItem(icon:Icon(Icons.history),
              label: "History"),

          BottomNavigationBarItem(icon:Icon(Icons.person),
              label: "Profile"),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.lightBlue,
        backgroundColor: Colors.white,
        type:BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}

