import 'package:flutter/material.dart';
import 'package:send_mail/commen/util/injectable/injectable_init.dart';
import 'package:send_mail/features/app/presentation/ui/app.dart';

void main() {
  configureDependencies();
  runApp(const SendMailApp());
}
