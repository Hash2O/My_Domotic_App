import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/device/device_bloc.dart';
import '../blocs/device/device_event.dart';
import '../blocs/device/device_state.dart';

class DevicesPage extends StatelessWidget {
  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes appareils'),
      ),

      body: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) {

          if (state is DeviceLoaded) {

            return ListView.builder(
              itemCount: state.devices.length,

              itemBuilder: (context, index) {

                final device = state.devices[index];

                return Card(
                  margin: const EdgeInsets.all(10),

                  child: ListTile(
                    leading: Icon(
                      device.type == 'Light'
                          ? Icons.lightbulb
                          : device.type == 'Security'
                              ? Icons.security
                              : Icons.thermostat,
                    ),

                    title: Text(device.name),

                    subtitle: Text(
                      device.isOn ? 'Activé' : 'Désactivé',
                    ),

                    trailing: Switch(
                      value: device.isOn,

                      onChanged: (_) {

                        context.read<DeviceBloc>().add(
                          ToggleDeviceEvent(device.id),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}