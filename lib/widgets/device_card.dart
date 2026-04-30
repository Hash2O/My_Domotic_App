import 'package:flutter/material.dart';

import '../models/device_model.dart';

class DeviceCard extends StatelessWidget {

  final DeviceModel device;
  final VoidCallback onToggle;

  const DeviceCard({
    super.key,
    required this.device,
    required this.onToggle,
  });

  IconData getDeviceIcon() {

    switch (device.type) {

      case 'Light':
        return Icons.lightbulb;

      case 'Security':
        return Icons.security;

      case 'Temperature':
        return Icons.thermostat;

      default:
        return Icons.devices;
    }
  }

  Color getStatusColor() {
    return device.isOn
        ? Colors.greenAccent
        : Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),

      child: Padding(
        padding: const EdgeInsets.all(18),

        child: Row(
          children: [

            Container(
              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color: getStatusColor().withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),

              child: Icon(
                getDeviceIcon(),
                color: getStatusColor(),
                size: 32,
              ),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    device.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    device.isOn
                        ? 'Appareil actif'
                        : 'Appareil inactif',

                    style: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),

            Switch(
              value: device.isOn,
              onChanged: (_) => onToggle(),
            ),
          ],
        ),
      ),
    );
  }
}