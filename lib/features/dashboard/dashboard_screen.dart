import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/utils/widgets/kd_maintenance_widget.dart';

import 'dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const KdMaintenanceWidget();
  }
}
