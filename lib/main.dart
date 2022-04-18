import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:send_mail/commen/util/firebase/firebase_options.dart';
import 'package:send_mail/commen/util/injectable/injectable_init.dart';
import 'package:send_mail/features/app/presentation/ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOption.currentPlatform,
  );
  configureDependencies();
  runApp(const SendMailApp());
}
