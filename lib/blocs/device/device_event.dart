import 'package:equatable/equatable.dart';

// ce qui arrive dans l’application
abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}

class LoadDevicesEvent extends DeviceEvent {}

class ToggleDeviceEvent extends DeviceEvent {
  final int deviceId;

  const ToggleDeviceEvent(this.deviceId);

  @override
  List<Object> get props => [deviceId];
}