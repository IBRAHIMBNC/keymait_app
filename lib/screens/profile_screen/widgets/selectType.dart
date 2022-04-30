import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../widgets/smallText.dart';

class SelectPlaceType extends StatefulWidget {
  const SelectPlaceType({Key? key}) : super(key: key);

  @override
  State<SelectPlaceType> createState() => _SelectPlaceTypeState();
}

class _SelectPlaceTypeState extends State<SelectPlaceType> {
  int selectedIndex = 0;
  List<_GridItemCard> gridItems() => [
        _GridItemCard(
          isSelected: selectedIndex == 0,
          title: 'Shared Room',
          image: 'assets/images/mky-moody.jpg',
        ),
        _GridItemCard(
          isSelected: selectedIndex == 1,
          title: 'Single Room',
          image: 'assets/images/mky-moody.jpg',
        ),
        _GridItemCard(
          isSelected: selectedIndex == 2,
          title: 'Flat',
          image: 'assets/images/mky-moody.jpg',
        ),
        _GridItemCard(
          isSelected: selectedIndex == 3,
          title: 'Bungalow',
          image: 'assets/images/mky-moody.jpg',
        ),
        _GridItemCard(
          isSelected: selectedIndex == 4,
          title: 'Duplex',
          image: 'assets/images/mky-moody.jpg',
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: 100.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 16.h,
            crossAxisSpacing: 11.w,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          padding: EdgeInsets.symmetric(vertical: 2.h),
        ),
      ),
    );
  }
}

class _GridItemCard extends StatelessWidget {
  final String title;
  final String image;
  final bool isSelected;
  const _GridItemCard({
    Key? key,
    required this.title,
    required this.image,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        height: 10.h,
        width: 10.h,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.black26),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black45),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (isSelected)
                    SvgPicture.asset(
                      'assets/icons/Path 13865.svg',
                      color: Colors.white,
                      width: 7.w,
                    ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    constraints: BoxConstraints(minWidth: 20.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.6)),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: SmallText(
                      size: 12,
                      text: title,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
