import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transit_task/core/theme/colors.dart';
import 'package:transit_task/core/theme/textStyles.dart';
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';
import 'package:transit_task/presentation/home/view/widgets/personDetailsScreen.dart';

class PersonListItem extends StatefulWidget {
  PersonResponseEntity personResponseEntity;

  PersonListItem({required this.personResponseEntity});

  @override
  State<PersonListItem> createState() => _PersonListItemState();
}

class _PersonListItemState extends State<PersonListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PersonDetailsScreen(
            personResponseEntity: widget.personResponseEntity),
      )),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          margin: EdgeInsets.only(bottom: 20.h),
          decoration: BoxDecoration(
              color: MyColors.backGroundColor,
              borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                width: 100.w,
                height: 150.h,
                fit: BoxFit.fill,
                imageUrl:
                    'https://image.tmdb.org/t/p/original${widget.personResponseEntity.profilePath}' ??
                        '',
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                        color: MyColors.primaryColor)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              SizedBox(
                width: 20.w,
              ),
              Container(
                height: 150.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.personResponseEntity.name ?? '',
                      style: Styles.textStyle16.copyWith(
                          color: MyColors.blackColor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      widget.personResponseEntity.knownForDepartment ?? '',
                      style: Styles.textStyle16.copyWith(
                          color: MyColors.blackColor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Rating:${widget.personResponseEntity.popularity}',
                      style: Styles.textStyle16.copyWith(
                          color: MyColors.blackColor,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
