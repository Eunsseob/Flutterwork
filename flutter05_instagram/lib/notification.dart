import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

final notifications = FlutterLocalNotificationsPlugin();

//앱 로드시 실행할 기본설정
initNotification(context) async {
  // 시간대 데이터 초기화
  tz.initializeTimeZones();

  var androidSetting = const AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );

  // 안드로이드 13 이상 권한 요청
  if (Platform.isAndroid) {
    notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  // iOS 설정
  var iosSetting = const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  var initializationSettings = InitializationSettings(
    android: androidSetting,
    iOS: iosSetting,
  );

  await notifications.initialize(
    initializationSettings,
    // 알림을 클릭 했을 때 새로운 창 열기
    onDidReceiveNotificationResponse: (payload) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Scaffold(appBar: AppBar(), body: Text('창이 열리는 알림')),
        ),
      );
    },
  );
}

// 안드로이드 디테일
showNotification() async {
  var androidDetails = AndroidNotificationDetails(
    '유니크한 알림 ID',
    '알림 종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 255, 0),
  );

  var iosDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  await notifications.show(
    1,
    '제목1',
    '내용1',
    NotificationDetails(android: androidDetails, iOS: iosDetails),
    payload: '정보들', // 알림에 대한 정보를 몰래 심어 놓을 수 있다.
    // 잘 사용하지 않음. 버그도 많고 재렌더링 안됨
  );
}

showNotification2() async {
  var androidDetails = AndroidNotificationDetails(
    '유니크한 알림 ID',
    '알림 종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 255, 0),
  );

  var iosDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  // 3초 후에 한번만 울림
  // await notifications.zonedSchedule(
  //   2,
  //   '에약 알림 제목',
  //   '3초 후 알림',
  //   tz.TZDateTime.now(tz.local).add(Duration(seconds: 3)),
  //   NotificationDetails(android: androidDetails, iOS: iosDetails),
  //   androidScheduleMode: AndroidScheduleMode.inexact, // 대략적인 시간
  //   // androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // 정확한 시간에 울려라
  // );

  // await notifications.zonedSchedule(
  //   3,
  //   '매달 같은시간알람 제목',
  //   '매달 같은 시간 알림',
  //   tz.TZDateTime.now(tz.local),
  //   NotificationDetails(android: androidDetails, iOS: iosDetails),
  //   androidScheduleMode: AndroidScheduleMode.inexact, // 대략적인 시간
  //   matchDateTimeComponents: DateTimeComponents.dateAndTime,
  // );

  await notifications.zonedSchedule(
    5,
    '제목5',
    '내용5',
    makeDate(10, 30, 25),
    NotificationDetails(android: androidDetails, iOS: iosDetails),
    androidScheduleMode: AndroidScheduleMode.inexact,
  );
}

makeDate(hour, min, sec) {
  var now = tz.TZDateTime.now(tz.local);
  var when = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    hour,
    min,
    sec,
  );
  if (when.isBefore(now)) {
    return when.add(Duration(days: 1));
  } else {
    return when;
  }
}

// // 예정된 알림 취소
// await notifications.cancel(1);

// // 모든 알림 취소
// await notifications.cancelAll();
