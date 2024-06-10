import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transit_task/core/theme/colors.dart';
import 'package:transit_task/core/theme/textStyles.dart';
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';


import 'package:gal/gal.dart';
import 'package:transit_task/presentation/home/view_model/homeScreenStates.dart';
import 'package:transit_task/presentation/home/view_model/home_view_model.dart';
import 'package:transit_task/utils/dialog_utils.dart';
class PersonDetailsScreen extends StatelessWidget {
  PersonResponseEntity personResponseEntity;

  PersonDetailsScreen({required this.personResponseEntity});

  @override
  Widget build(BuildContext context) {
    var homeCubit=BlocProvider.of<HomeScreenViewModel>(context);
    return BlocListener<HomeScreenViewModel,HomeScreenStates>(listener: (context, state) {
   if(state is DownloadImageLoadingState){
     DialogUtils.showLoading(context: context);
   } else if (state is DownloadImageFailureState){
     DialogUtils.hideLoading(context);
     DialogUtils.showMessage(context: context, message: state.errMsg, actionName: "OK");
   } else if(state is DownloadImageSuccessState){
     DialogUtils.hideLoading(context);
     DialogUtils.showMessage(context: context, message: 'Image Downloaded Successfully', actionName: "OK");
   }
    },
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        appBar: AppBar(iconTheme: IconThemeData(color: MyColors.darkGreyColor),
          title: Text(
            personResponseEntity.name ?? "",
            style: Styles.textStyle24.copyWith(color: MyColors.darkGreyColor),
          ),
        ),
        body: Column(children: [
          // Image.network(
          //     'https://image.tmdb.org/t/p/original${personResponseEntity.profilePath}'),
          CachedNetworkImage(fit:BoxFit.fill ,
            imageUrl:  'https://image.tmdb.org/t/p/original${personResponseEntity.profilePath}' ??
                '',
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator(color: MyColors.primaryColor)),
            errorWidget: (context, url, error) => const Icon(Icons.error),),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: MyColors.purpleColor),
              onPressed: () async {
                homeCubit.downloadImage(personResponseEntity.profilePath??"");
              },
              child: Text(
                'Save Image',
                style: Styles.textStyle20.copyWith(color: MyColors.whiteColor),
              ))
        ]),
      ),
    );
  }
}
