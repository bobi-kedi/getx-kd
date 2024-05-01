import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/utils/widgets/kd_maintenance_widget.dart';

import 'market_controller.dart';

class MarketScreen extends GetView<MarketController> {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const KdMaintenanceWidget();
  }
}
