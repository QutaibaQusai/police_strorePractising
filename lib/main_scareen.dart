import 'package:flutter/material.dart';
import 'package:police/model/items.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // List itemName = ["banana", "babaya", "fruit", "Apple", "mango"];
  // List<double> itemPrices = [2, 3, 4, 5];
  List<Item> listItem = [
    Item(
        itemImage: "assets/Tomato-removebg-preview.png",
        itemName: "Tomato",
        itemPrice: 0.80),
    Item(
        itemImage: "assets/Orange-removebg-preview.png",
        itemName: "Orange",
        itemPrice: 1.20),
    Item(
        itemImage: "assets/Grape-removebg-preview.png",
        itemName: "Grape",
        itemPrice: 0.59),
    Item(
        itemImage: "assets/Carrot-removebg-preview.png",
        itemName: "Carrot",
        itemPrice: 0.30),
    Item(
        itemImage: "assets/Broccoli-removebg-preview.png",
        itemName: "Broccoli",
        itemPrice: 2.0),
    Item(
        itemImage: "assets/download-removebg-preview.png",
        itemName: "Potato",
        itemPrice: 0.60)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listItem.length,
              itemBuilder: (context, index) {
                return tile(
                  context: context,
                  item: listItem[index],
                );
              },
            ),
          ),
          Container(
            height: 70,
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(" number of item in cart".toUpperCase()),
                        Text(numOfItem().toString()),
                      ],
                    ),
                    Expanded(child: Container()),
                    Column(
                      children: [
                        Text("total price".toUpperCase()),
                        Text(totalPrice().toString()),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  int numOfItem() {
    int quantity = 0;

    for (var i in listItem) {
      quantity = i.qty + quantity;
    }
    return quantity;
  }

  double totalPrice() {
    double totalPrice = 0;
    for (var y in listItem) {
      totalPrice = totalPrice + (y.itemPrice * y.qty);
    }
    return totalPrice;
  }

  Widget tile({required BuildContext context, required Item item}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                item.itemImage,
                width: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.itemName,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "${item.itemPrice} JD/kilo",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () {
                    if (item.qty == 0) {
                      return;
                    }
                    item.qty = item.qty - 1;

                    setState(() {});
                  },
                  icon: const Icon(Icons.remove)),
              Text(
                item.qty.toString(),
                style: TextStyle(fontSize: 18),
              ),
              IconButton(
                  onPressed: () {
                    item.qty = item.qty + 1;

                    setState(() {});
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
        ),
      ),
    );
  }
}
