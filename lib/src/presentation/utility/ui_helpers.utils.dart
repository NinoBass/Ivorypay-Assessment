import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ivorypay/src/data/enums/error_type.enum.dart';
import 'package:ivorypay/src/presentation/utility/flushbar/show-flushbar.helper.dart';

Future<void> preCacheSvgImages(String svgImage) async {
  await precachePicture(
    ExactAssetPicture(
      SvgPicture.svgStringDecoderBuilder,
      svgImage,
    ),
    null,
  );
}

Future<void> copyToClipboard({
  required String text,
}) async {
  await Clipboard.setData(
    ClipboardData(
      text: text,
    ),
  );
  showFlushBar(
    message: 'Address copied to clipboard',
    errorType: ErrorType.success,
  );
}
