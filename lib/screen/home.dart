import 'package:flutter/material.dart';
import 'package:flutter_book_app/screen/all_books.dart';
import 'package:flutter_book_app/screen/book_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("BookShop"),
      ),
      drawer: new Drawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.black12,
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Search Books',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    "images/ads.png",
                    fit: BoxFit.fill,
                    // color: Colors.transparent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllBooks()));
                        },
                        child: Text("See All"))
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 280,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: listGenerator(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Selling Books",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    TextButton(onPressed: () {}, child: Text("See All"))
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 280,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: listGenerator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listGenerator() {
    return ListView.builder(
        // padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: 13,
        itemBuilder: (context, index) {
          return BookCard(context);
        });
  }

  Widget BookCard(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BookDetail()));
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ClipRRect(
                // borderRadius: BorderRadius.circular(25),
                child: Image.network(
              "https://itbook.store/img/books/9781617294136.png",
              fit: BoxFit.fill,
              height: 180,
              width: 300,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "Designing Across Senses",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "A Multimodal Approach to Product Design",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
