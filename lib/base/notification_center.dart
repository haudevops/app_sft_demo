import 'package:rxdart/rxdart.dart';

class NotificationCenter {
  static final NotificationCenter share = NotificationCenter();

  // ignore: close_sinks
  PublishSubject notificationPublishSubject = PublishSubject<dynamic>();
}
