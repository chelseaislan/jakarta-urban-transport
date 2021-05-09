import 'package:flutter/material.dart';

// KRL/MRT/LRT DLL
class TransportTypes {
  final String transportName;
  final String transportStatus;
  final Color iconColor;
  final IconData cardIcon;
  final Function onItemTap;

  TransportTypes(
      this.transportName, this.transportStatus, this.iconColor, this.cardIcon, this.onItemTap);
  // Backup TransportTypes(
  //      "Central Line", "Perjalanan Normal", Colors.red, Icons.train_rounded),
}

class TransportLineTypes {
  final String lineName;
  final String lineStatus;
  final Color iconColor;
  final IconData cardIcon;
  final Function onItemTap;

  TransportLineTypes(
      this.lineName, this.lineStatus, this.iconColor, this.cardIcon, this.onItemTap);
}
