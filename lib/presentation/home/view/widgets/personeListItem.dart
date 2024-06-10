import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';

class PersonListItem extends StatelessWidget {
  PersonResponseEntity personResponseEntity;

  PersonListItem({required this.personResponseEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
            'https://image.tmdb.org/t/p/original${personResponseEntity.profilePath}' ??
                '',
            fit: BoxFit.fill,
            height: 200.h,
            width: 100.w),
        SizedBox(
          width: 20.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(personResponseEntity.name ?? ''),
            SizedBox(height: 10.h,),
            Text(personResponseEntity.knownForDepartment ?? ''),
            SizedBox(height: 10.h,),
            Text('Rating:${personResponseEntity.popularity}')
          ],
        ),
      ],
    ));
  }
}
