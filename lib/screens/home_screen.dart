import 'package:flutter/material.dart';
import 'package:moviemaze/data/movie.dart';
import 'package:moviemaze/utils/colors.dart';
import 'package:moviemaze/widgets/custom_card_thumbnail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //items
  List<MovieModel> foryouItemsList = List.of(forYouImages);
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KBackgroundColor,
        body: Stack(
          children: [
            //For Items
            SafeArea(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //top Container
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hi, Olumide!",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    // color: Colors.green,
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(
                                        image: AssetImage("assets/actor_4.png"),
                                        fit: BoxFit.cover)),
                              ),
                              Positioned(
                                  right: 2,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: KButtonColor,
                                    ),
                                    height: 10,
                                    width: 10,
                                  ))
                            ],
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: KSearchbarColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(children: [
                        Icon(
                          Icons.search,
                          color: Colors.white30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(fontSize: 18, color: Colors.white30),
                        )
                      ]),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Text(
                      "For you",
                      style: TextStyle(color: Colors.white54, fontSize: 20),
                    ),
                  ),
                  foryoucardsLayout(forYouImages)
                ],
              ),
            )),

            //for BottomNav
            // Positioned(child: Container())
          ],
        ));
  }

  Widget foryoucardsLayout(List<MovieModel> movielist) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.50,
      child: PageView.builder(
        controller: pageController,
        itemCount: movielist.length,
        itemBuilder: (context, index) {
          return CustomCardThumbnail(imageAsset: movielist[index].toString());
        },
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
      ),
    );
  }
}
