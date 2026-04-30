import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/device/device_state.dart';
import '../blocs/device/device_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Domotic Dashboard'),
      ),

      body: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) {

          if (state is DeviceLoaded) {

            final activeDevices =
                state.devices.where((d) => d.isOn).length;

            return Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const SizedBox(height: 20),

                  const Text(
                    'Bienvenue',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Votre système domotique est opérationnel',

                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Row(
                    children: [

                      Expanded(
                        child: buildStatCard(
                          title: 'Appareils',
                          value:
                              '${state.devices.length}',
                          icon: Icons.devices,
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: buildStatCard(
                          title: 'Actifs',
                          value: '$activeDevices',
                          icon: Icons.flash_on,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Activité récente',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  buildActivityTile(
                    'Lampe Salon activée',
                    Icons.lightbulb,
                  ),

                  buildActivityTile(
                    'Caméra connectée',
                    Icons.security,
                  ),

                  buildActivityTile(
                    'Thermostat synchronisé',
                    Icons.thermostat,
                  ),
                ],
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildStatCard({
    required String title,
    required String value,
    required IconData icon,
  }) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            Icon(
              icon,
              size: 40,
              color: Colors.cyanAccent,
            ),

            const SizedBox(height: 16),

            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(title),
          ],
        ),
      ),
    );
  }

  Widget buildActivityTile(
    String text,
    IconData icon,
  ) {

    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.cyanAccent,
        ),
        title: Text(text),
      ),
    );
  }
}