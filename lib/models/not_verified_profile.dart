import 'package:flutter/material.dart';
class NotVerifiedProfile {
  String title;
  Color iconColor;
  IconData iconData;
  bool isActive;
  bool isPendingVerification;

  NotVerifiedProfile({required this.title,
  required this.iconColor,
  required this.iconData,
  required this.isActive,
  required this.isPendingVerification});
}