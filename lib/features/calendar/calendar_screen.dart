import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelasdigital/utils/widgets/kd_maintenance_widget.dart';

import 'calendar_controller.dart';

class CalendarScreen extends GetView<CalendarController> {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const KdMaintenanceWidget();
  }
}
