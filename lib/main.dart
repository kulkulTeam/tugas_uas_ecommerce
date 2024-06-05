import 'package:flutter/material.dart';
import 'package:tugas_uas/pages/cart_details.dart';
import 'package:tugas_uas/pages/home_screen.dart';
import 'package:tugas_uas/pages/favorite_screen.dart';
import 'package:tugas_uas/pages/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:tugas_uas/providers/cart_provider.dart';
import 'package:tugas_uas/providers/favorite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E - Commerce Shop',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  List screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title : const Text("E - Commerce Shop"),
      backgroundColor: Colors.red,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const CartDetails(),
           ),
        ),
        icon: const Icon(Icons.add_shopping_cart)),
       ],
     ),
     body: screens[currentIndex],
     bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() => currentIndex = value);
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Favorit",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
     ),
    );
  }
}