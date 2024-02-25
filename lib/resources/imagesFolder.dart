import 'package:secure_fitness_comp/resources/appColors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';
import 'package:sizer/sizer.dart';

import 'components/Buttons.dart';

class ImagesFolder {
  static var baseImage = "https://advo.xeetechpk.com/storage/";

  static String blogsFolder = "${baseImage}blogs/";
  static String patients = "${baseImage}patients/";
  static String articles = "${baseImage}articles/";
  static String therapist = "${baseImage}therapist/";
  static String products = "${baseImage}products/";
  static String solutions = "${baseImage}solutions/";
  static String thumbnails = "${baseImage}thumbnails/";
  static String specialities = "${baseImage}specialities/";
  static String videos = "${baseImage}videos/";

  static String netImage =
      "https://img.freepik.com/free-vector/front-car-concept-illustration_114360-7978.jpg?w=900&t=st=1696244645~exp=1696245245~hmac=742ad4c5811a04e1f1190e82b7784ee967ad3958392a58419a0950900125f737";

  static CachedNetworkImage getImage({
    required String url,
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => loading(),
      errorWidget: (context, url, error) => Image.asset(
        ImagesPaths.demo,
        height: 4.h,
      ),
      fit: BoxFit.cover,
    );
  }
}
