import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/settings_screen.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import '../misc/colors.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppLargeText(text: widget.data['name']),
      ),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                child: Container(
                  width: 470,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/travel-app-a01eb.appspot.com/o/${widget.data['img']}.jpg?alt=media&token=3001d812-e439-40e3-9def-f2066271bc19"),
                        fit: BoxFit.cover),
                  ),
                )),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30,
                ),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                    color: context.watch<ThemeModeData>().isDarkModeActive
                        ? const Color.fromARGB(255, 28, 27, 31)
                        : Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppLargeText(
                          text: widget.data['name'],
                        ),
                        AppLargeText(
                          text: "   \$${widget.data['price']}",
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: widget.data['location'],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: index < widget.data["stars"]
                                    ? AppColors.starColor
                                    : AppColors.textColor2);
                          }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AppText(
                          text: "(${widget.data['stars']}.0)",
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // AppLargeText(
                    //     text: "People",
                    //     color: Colors.black.withOpacity(0.8),
                    //     size: 20),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    // AppText(
                    //   text: "Number of people in your group",
                    //   color: AppColors.mainTextColor,
                    // ),
                    // const SizedBox(height: 10,),
                    // Wrap(
                    //   children: List.generate(5, (index) {
                    //     return InkWell(
                    //       onTap: (){
                    //         selectedIndex=index;
                    //       },
                    //       child: Container(
                    //         margin: const EdgeInsets.only(right: 10),
                    //         child: AppButtons(
                    //           size: 50,
                    //           color: selectedIndex==index?Colors.black:Colors.white,
                    //           backgroundColor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                    //           borderColor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                    //           text:(index+1).toString(),

                    //         ),
                    //       ),
                    //     );
                    //   }),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: "Description",
                      size: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppText(
                      text: widget.data['description'],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                    size: 60,
                    color: AppColors.textColor1,
                    backgroundColor:
                        context.watch<ThemeModeData>().isDarkModeActive
                            ? const Color.fromARGB(255, 28,27,31) 
                            : Colors.white,
                    borderColor: AppColors.textColor1,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Handle tap action
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: AppText(
                                text: "Book Trip Now",
                                // color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
