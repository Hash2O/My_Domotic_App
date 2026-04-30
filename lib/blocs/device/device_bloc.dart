import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/device_model.dart';
import 'device_event.dart';
import 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc() : super(DeviceInitial()) {

    on<LoadDevicesEvent>((event, emit) {

      final devices = [
        DeviceModel(
          id: 1,
          name: 'Lampe Salon',
          type: 'Light',
          isOn: true,
        ),

        DeviceModel(
          id: 2,
          name: 'Thermostat',
          type: 'Temperature',
          isOn: false,
        ),

        DeviceModel(
          id: 3,
          name: 'Caméra Entrée',
          type: 'Security',
          isOn: true,
        ),
      ];

      emit(DeviceLoaded(devices));
    });

    on<ToggleDeviceEvent>((event, emit) {

      if (state is DeviceLoaded) {

        final currentState = state as DeviceLoaded;

        final updatedDevices =
            currentState.devices.map((device) {

          if (device.id == event.deviceId) {
            return device.copyWith(
              isOn: !device.isOn,
            );
          }

          return device;

        }).toList();

        emit(DeviceLoaded(updatedDevices));
      }
    });
  }
}