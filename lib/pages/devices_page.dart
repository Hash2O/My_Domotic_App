import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/device/device_bloc.dart';
import '../blocs/device/device_event.dart';
import '../blocs/device/device_state.dart';

import '../widgets/device_card.dart';

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

            return ListView(
              children: [

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),

                  child: Text(
                    '${state.devices.length} appareils connectés',

                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                ...state.devices.map((device) {

                  return DeviceCard(
                    device: device,

                    onToggle: () {

                      context.read<DeviceBloc>().add(
                        ToggleDeviceEvent(device.id),
                      );
                    },
                  );
                }),
              ],
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