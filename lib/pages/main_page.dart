import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uangkoo/pages/category_page.dart';
import 'package:uangkoo/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _listPage = [HomePage(), CategoryPage()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currentIndex == 0) ? CalendarAppBar(
        onDateChanged: (value) => print(value),
        backButton: false,
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
        locale: 'id',
        accent: Colors.lightGreen,
      ) : PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
            child: Text(
              'Categories',
              style: GoogleFonts.montserrat(
                fontSize: 20
              ),
            ),
          )
      ),
      body: _listPage[currentIndex],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  onTapTapped(0);
                },
                icon: Icon(Icons.home)
            ),
            const SizedBox(width: 40,),
            IconButton(
                onPressed: () {
                  onTapTapped(1);
                },
                icon: Icon(Icons.list)
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: (currentIndex == 0) ? true : false,
        child: FloatingActionButton(
            onPressed: (){},
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void onTapTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
