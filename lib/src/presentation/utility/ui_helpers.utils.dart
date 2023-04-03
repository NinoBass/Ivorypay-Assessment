import 'package:flutter_svg/flutter_svg.dart';

Future<void> preCacheSvgImages(String svgImage) async {
  await precachePicture(
    ExactAssetPicture(
      SvgPicture.svgStringDecoderBuilder,
      svgImage,
    ),
    null,
  );
}
