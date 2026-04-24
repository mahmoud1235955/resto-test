import 'package:flutter/material.dart';
import 'package:rsto/models/food_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  String name = "";
  List<String> foods = ["burger", "pizza", "pasta", "sushi", "steak", "salad"];
  int selectedIndex = 0;
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
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Edit Name"),
                                content: TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Name',
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        name = nameController.text;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text("Save"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            child: Text(foods[index]),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selectedIndex == index
                                  ? Colors.grey
                                  : Colors.deepOrangeAccent,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10);
                      },
                      itemCount: foods.length,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: foodDetails[selectedIndex].length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.network(
                                foodDetails[selectedIndex][index].imgUrl,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                              Text(foodDetails[selectedIndex][index].name),
                              Text(foodDetails[selectedIndex][index].price),
                              Text(foodDetails[selectedIndex][index].weight),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
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
