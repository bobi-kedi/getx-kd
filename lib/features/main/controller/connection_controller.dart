import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionController extends GetxController {
  static ConnectionController get to => Get.find();

  RxBool isConnectedToNetwork = false.obs;
  final RxBool _showAlertConnection = false.obs;

  bool get showAlertConnection => _showAlertConnection.value;
  set showAlertConnection(bool value) => _showAlertConnection.value = value;

  RxString deviceConnectionStatus = 'checking'.obs;
  Rx<MaterialColor> connectionStatusColor = Colors.red.obs;
  Rx<ConnectivityResult> connectionStatus = ConnectivityResult.none.obs;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    connectionStatus.value = result;
    if (result == ConnectivityResult.wifi) {
      isConnectedToNetwork.value = true;
      deviceConnectionStatus.value = 'wifi';
      connectionStatusColor.value = Colors.green;
      _showNotificationMessageWhenConnected();
    } else if (result == ConnectivityResult.mobile) {
      isConnectedToNetwork.value = true;
      deviceConnectionStatus.value = 'Mobile';
      connectionStatusColor.value = Colors.green;
      _showNotificationMessageWhenConnected();
    } else if (result == ConnectivityResult.none) {
      isConnectedToNetwork.value = false;
      deviceConnectionStatus.value = 'Offline';
      connectionStatusColor.value = Colors.red;
      _showNotificationMessageWhenDisconnected();
    } else {
      isConnectedToNetwork.value = false;
      deviceConnectionStatus.value = 'Error';
      connectionStatusColor.value = Colors.orange;
      _showNotificationMessageWhenDisconnected();
    }
  }

  void _showNotificationMessageWhenConnected() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
  }

  void _showNotificationMessageWhenDisconnected() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }

    if (_showAlertConnection.value) {
      Get.snackbar(
        'Device network connection lost',
        'Please check your internet connection',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(days: 1),
        icon: connectionStatus.value == ConnectivityResult.none
            ? const Icon(Icons.network_check_rounded)
            : Container(),
        isDismissible: false,
        showProgressIndicator: !isConnectedToNetwork.value ? false : true,
        progressIndicatorBackgroundColor: Colors.black,
        progressIndicatorValueColor:
            AlwaysStoppedAnimation(connectionStatusColor.value),
        forwardAnimationCurve: Curves.decelerate,
        reverseAnimationCurve: Curves.easeInBack,
      );
    }
  }

  Widget showBar() {
    return LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
        connectionStatusColor.value,
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
