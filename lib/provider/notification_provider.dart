
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../data/model/response/notification_model.dart';
import '../data/repository/notification_repo.dart';
import 'package:collection/collection.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationRepo? notificationRepo;
  NotificationProvider({required this.notificationRepo});
  List<NotificationModel> notifications = [];

  Map<String?, List<NotificationModel>>? _groupedNotificationsByDate;
  Map<String?, List<NotificationModel>>? get groupedNotificationsByDate =>
      _groupedNotificationsByDate;
  set groupedNotificationsByDate(Map<String?, List<NotificationModel>>? value) {
    _groupedNotificationsByDate = value;
    notifyListeners();
  }

  Map<String?, List<NotificationModel>>? _groupedNotificationsByTitle;
  Map<String?, List<NotificationModel>>? get groupedNotificationsByTitle =>
      _groupedNotificationsByTitle;
  set groupedNotificationsByTitle(Map<String?, List<NotificationModel>>? value) {
    _groupedNotificationsByTitle = value;
    notifyListeners();
  }

  getAllNotifications() async {
    try {
      notifications.clear();
      var response = await notificationRepo?.getAllNotifications();
      var res = response?.response;

      if (res!=null && res.data['status']) {
        notifications = notificationModelFromJson(res.data['data']);

        groupedNotificationsByDate = groupBy(notifications, (NotificationModel notification) {
          return formatDateTime(notification.createdAt??DateTime.now());
        });

        groupedNotificationsByTitle = groupBy(notifications, (NotificationModel notification) {
          return notification.title?.trim()??'';
        });

      } else {
        Get.snackbar(
          "Notifications",
          res?.data['message'],
          backgroundColor: Colors.amberAccent,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          borderRadius: 10.r,
        );
      }
    } catch (err) {
      Get.snackbar(
        "Notifications",
        'Please  check your internet access and try again',
        backgroundColor: Colors.amberAccent,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        borderRadius: 10.r,
      );
    }
  }
  String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('d MMM y');
    return formatter.format(dateTime);
  }
}