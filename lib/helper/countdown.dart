import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../provider/auction_provider.dart';

String calculateTimeLeft(DateTime eventDateTime,String initialText) {
  DateTime currentDateTime = DateTime.now();
  Duration difference = eventDateTime.difference(currentDateTime);

  if (difference.isNegative) {
    Provider.of<AuctionProvider>(Get.context!,listen: false).getAuctionData();
    return 'Event has already passed.';
  }

  int days = difference.inDays;
  int hours = difference.inHours % 24;
  int minutes = difference.inMinutes % 60;
  int seconds = difference.inSeconds % 60;

  String timeLeft = initialText;
  if (days > 0) {
    timeLeft += '${days}d ';
  }
  if (hours > 0) {
    timeLeft += '${hours}h ';
  }
  if (minutes > 0) {
    timeLeft += '${minutes}m ';
  }
  if (seconds > 0) {
    timeLeft += '${seconds}s';
  }
  return timeLeft.trim();
}
