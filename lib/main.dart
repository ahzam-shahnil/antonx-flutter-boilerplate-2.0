import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/app.dart';
import 'package:flutter_antonx_boilerplate/core/enums/env.dart';
import 'package:logger/logger.dart';
import 'locator.dart';

Future<void> main() async {
  final log = Logger();
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await setupLocator(Env.production);
    runApp(const MyApp(title: 'App Name'));
  } catch (e, s) {
    log.d("$e");
    log.d("$s");
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final log = Logger();
  await Firebase.initializeApp();
  log.d("Handling a background message: ${message.messageId}");
}
