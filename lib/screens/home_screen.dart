import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://i.pinimg.com/1200x/0c/ac/c9/0cacc9abcaa47092e06f6e6bc7cfece4.jpg",
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: MediaQuery.sizeOf(context).width * 0.5 - 50,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://i.pinimg.com/736x/1b/3c/ab/1b3cabfbc3d28623d145875590c4832b.jpg",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
