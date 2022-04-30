import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keymait_app/constants.dart';
import 'package:keymait_app/widgets/smallText.dart';
import 'package:sizer/sizer.dart';

import 'header.dart';

class PlaceCategory extends StatefulWidget {
  const PlaceCategory({Key? key}) : super(key: key);

  @override
  State<PlaceCategory> createState() => _PlaceCategoryState();
}

class _PlaceCategoryState extends State<PlaceCategory> {
  int selectedIndex = 0;
  List<_GridItemCard> gridItems() => [
        _GridItemCard(
            isSelected: selectedIndex == 0,
            title: 'Guest House',
            image: 'assets/pngs/guest-house.png',
            description: 'A separate building From the main house '),
        _GridItemCard(
            isSelected: selectedIndex == 1,
            title: 'Private Home',
            image: 'assets/pngs/accommodation.png',
            description: 'A separate building From the main house '),
        _GridItemCard(
            isSelected: selectedIndex == 2,
            title: 'Hotel',
            image: 'assets/pngs/5-stars.png',
            description: 'A separate building From the main house '),
        _GridItemCard(
            isSelected: selectedIndex == 3,
            title: 'Ranted Apartment',
            image: 'assets/pngs/house.png',
            description: 'A separate building From the main house '),
        _GridItemCard(
            isSelected: selectedIndex == 4,
            title: 'Suite',
            image: 'assets/pngs/room.png',
            description: 'A separate building From the main house '),
      ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 70.h,
      width: 100.w,
      child: Column(children: [
        Header(
            title: 'Select that best describes\nyou place?',
            onPressed: () {
              Get.back();
            }),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            itemCount: gridItems().length,
            itemBuilder: (context, index) => GestureDetector(
              child: gridItems()[index],
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 15,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              childAspectRatio: 1.15,
            ),
            padding: EdgeInsets.symmetric(vertical: 2.h),
          ),
        )),
      ]),
    );
  }
}

class _GridItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final bool isSelected;
  const _GridItemCard({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                border: isSelected ? Border.all(color: kSecondaryColor) : null,
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    width: 12.w,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SmallText(
                    text: title,
                    size: 13,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SmallText(
                      text: description,
                      size: 8,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isSelected)
            Positioned(
                top: 1.h,
                right: 2.w,
                child: SvgPicture.asset(
                  'assets/icons/Path 13865.svg',
                  width: 20,
                ))
        ]),
      ),
    );
  }
}
