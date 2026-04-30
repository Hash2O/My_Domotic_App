import 'package:equatable/equatable.dart';
import '../../models/device_model.dart';

abstract class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object> get props => [];
}

class DeviceInitial extends DeviceState {}

class DeviceLoaded extends DeviceState {
  final List<DeviceModel> devices;

  const DeviceLoaded(this.devices);

  @override
  List<Object> get props => [devices];
}