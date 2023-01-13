import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:inovola_app/constants/appColors.dart';
import 'package:inovola_app/constants/utils/dateTime_parser.dart';
import 'package:inovola_app/constants/widget/divider_item.dart';
import 'package:inovola_app/constants/widget/loading_item.dart';
import 'package:inovola_app/constants/utils/size_config.dart';
import 'package:inovola_app/constants/widget/space_item.dart';
import 'package:inovola_app/constants/widget/text.dart';
import 'package:inovola_app/modules/trip/controller/trip_provider.dart';
import 'package:provider/provider.dart';

class TripScreen extends StatefulWidget {
  @override
  _TripScreenState createState() => new _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  SwiperController swipeController = SwiperController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<TripProvider>(
      create: (_) => TripProvider(),
      child:
          Consumer<TripProvider>(builder: (_, TripProvider myProvider, child) {
        return Scaffold(
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: myProvider.isTripFetching
                ? const LoadingItem()
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// images swiper
                      Stack(
                        children: [
                          SizedBox(
                            height: getHeight(280),
                            child: Swiper(
                              scrollDirection: Axis.horizontal,
                              controller: swipeController,
                              containerWidth:size.width,
                              itemBuilder: (BuildContext context, int index) {
                                return Image.asset(
                                  myProvider.images[index],
                                  width: size.width,
                                  fit: BoxFit.fill,
                                );
                              },
                              itemCount: myProvider.images.length,
                              pagination: new SwiperPagination(
                                alignment: Alignment.bottomLeft,
                                builder: new DotSwiperPaginationBuilder(
                                    color: Colors.white38,
                                    activeColor: MyColors.whiteColor,
                                    activeSize: 12,
                                    size: 9),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_outlined,
                                  size: 26,
                                  color: MyColors.whiteColor,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.share_rounded,
                                      size: 26,
                                      color: MyColors.whiteColor,
                                    ),
                                    SpaceItem(width: getWidth(10)),
                                    Icon(
                                      Icons.star_border,
                                      size: 28,
                                      color: MyColors.whiteColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      /// screen content
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText.drawText(
                                        content: '# رحلة',
                                        fontSize: getFont(23),
                                        fontColor: MyColors.mediumGreyColor,
                                        bold: false),
                                    SpaceItem(height: getHeight(5)),
                                    MyText.drawText(
                                        content: myProvider.trip.title,
                                        fontSize: getFont(21),
                                        fontColor: MyColors.mediumGreyColor,
                                        bold: true),
                                    SpaceItem(height: getHeight(10)),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 23,
                                          color: MyColors.mediumGreyColor,
                                        ),
                                        SpaceItem(width: getWidth(10)),
                                        MyText.drawText(
                                            content: '${DateTimeHelper().dateParser(myProvider.trip.date)}',
                                            fontSize: getFont(19),
                                            fontColor: MyColors.mediumGreyColor,
                                            bold: false),
                                      ],
                                    ),
                                    SpaceItem(height: getHeight(10)),
                                    Row(
                                      children: [
                                        Transform.rotate(
                                            child: SvgPicture.asset(
                                          'assets/images/pin icon.svg',
                                          height: getHeight(17),
                                          width: getWidth(20),
                                          color: MyColors.mediumGreyColor,
                                        ),
                                         angle: pi/2,
                                        ),
                                        SpaceItem(width: getWidth(10)),
                                        MyText.drawText(
                                            content: myProvider.trip.address,
                                            fontSize: getFont(19),
                                            fontColor: MyColors.mediumGreyColor,
                                            bold: false),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const DividerItem(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: getWidth(45),
                                          height: getHeight(45),
                                          child: Container(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              child: Image.asset(
                                                  'assets/images/userImg.png',
                                                  height: getHeight(70),
                                                  width: getWidth(70),
                                                  fit: BoxFit.fitHeight),
                                            ),
                                          ),
                                        ),
                                        SpaceItem(width: getWidth(10)),
                                        MyText.drawText(
                                            content:
                                                myProvider.trip.trainerName,
                                            fontSize: getFont(20),
                                            fontColor: MyColors.mediumGreyColor,
                                            bold: false),
                                      ],
                                    ),
                                    SpaceItem(height: getHeight(10)),
                                    MyText.drawText(
                                        content: myProvider.trip.trainerInfo,
                                        fontSize: getFont(19),
                                        fontColor: MyColors.mediumGreyColor,
                                        bold: false),
                                  ],
                                ),
                              ),
                              const DividerItem(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText.drawText(
                                        content: 'عن الرحلة',
                                        fontSize: getFont(20),
                                        fontColor: MyColors.mediumGreyColor,
                                        bold: true),
                                    SpaceItem(height: getHeight(10)),
                                    MyText.drawText(
                                        content: myProvider.trip.occasionDetail,
                                        fontSize: getFont(19),
                                        fontColor: MyColors.mediumGreyColor,
                                        bold: false),
                                  ],
                                ),
                              ),
                              const DividerItem(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    MyText.drawText(
                                        content: 'تكلفة الرحلة',
                                        fontSize: getFont(20),
                                        fontColor: MyColors.mediumGreyColor,
                                        bold: true),
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: ListView.builder(
                                        itemCount:
                                            myProvider.trip.reservTypes.length,
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              MyText.drawText(
                                                  content: myProvider.trip
                                                      .reservTypes[index].name,
                                                  fontSize: getFont(19),
                                                  fontColor:
                                                      MyColors.mediumGreyColor,
                                                  bold: false),
                                              MyText.drawText(
                                                  content:
                                                      '${myProvider.trip.reservTypes[index].price} SAR',
                                                  fontSize: getFont(19),
                                                  fontColor:
                                                      MyColors.mediumGreyColor,
                                                  bold: false),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    SpaceItem(height: getHeight(20)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// reserve button
                      Container(
                        height: 60,
                        width: size.width,
                        child: MaterialButton(
                          onPressed: () {},
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          color: Colors.purple,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          child: MyText.drawText(
                              content: 'قم بالحجز الآن',
                              fontSize: getFont(19),
                              fontColor: MyColors.whiteColor,
                              bold: true),
                        ),
                      )
                    ],
                  ),
          ),
        );
      }),
    );
  }
}
