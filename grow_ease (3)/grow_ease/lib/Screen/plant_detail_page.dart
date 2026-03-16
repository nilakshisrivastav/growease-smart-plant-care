import 'package:flutter/material.dart';
import 'package:grow_ease/models/products.dart';
import 'package:grow_ease/utils/notification_service.dart'; // Make sure to import the notification service

class PlantDetailPage extends StatefulWidget {
  final Products plant;

  const PlantDetailPage({super.key, required this.plant});

  @override
  State<PlantDetailPage> createState() => _PlantDetailPageState();
}

class _PlantDetailPageState extends State<PlantDetailPage> {
  bool wateringReminderEnabled = false;
  bool fertilizerReminderEnabled = false;

  @override
  Widget build(BuildContext context) {
    final plant = widget.plant;

    return Scaffold(
      appBar: AppBar(
        title: Text(plant.p_name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Plant Image
            Image.network(plant.p_img, fit: BoxFit.cover),
            const SizedBox(height: 16),

            // Plant Benefits
            const Text("Plant Benefits",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 8),
            Text(plant.p_benefits, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            // Care Instructions
            const Text("Care Instructions",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.wb_sunny, color: Colors.yellow),
                const SizedBox(width: 8),
                Text("Sunlight: ${plant.sunlight}",
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.water_drop, color: Colors.blue),
                const SizedBox(width: 8),
                Text("Watering: ${plant.watering}",
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.terrain, color: Colors.brown),
                const SizedBox(width: 8),
                Text("Soil: ${plant.soil}",
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 16),

            // Tips
            const Text("Tips",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 8),
            Text(plant.tips, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 30),

            // 🔔 Reminder Section
            const Divider(),
            const Text("Reminders",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 8),

            SwitchListTile(
              title: const Text("Watering Reminder"),
              value: wateringReminderEnabled,
              onChanged: (value) async {
                setState(() => wateringReminderEnabled = value);
                int id = plant.p_id.hashCode;

                if (value) {
                  // Schedule an in-app reminder (demo: 10 seconds after enabling)
                  NotificationService.scheduleInAppReminder(
                    context: context,
                    title: "Time to water ${plant.p_name}",
                    body: "Give your ${plant.p_name} some water 💧",
                    delay: const Duration(seconds: 10), // Demo delay
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Watering reminder set!")),
                  );
                } else {
                  // Logic to cancel reminder if needed
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Watering reminder canceled.")),
                  );
                }
              },
            ),

            SwitchListTile(
              title: const Text("Fertilizer Reminder"),
              value: fertilizerReminderEnabled,
              onChanged: (value) async {
                setState(() => fertilizerReminderEnabled = value);
                int id = plant.p_id.hashCode + 1;

                if (value) {
                  // Schedule an in-app reminder (demo: 20 seconds after enabling)
                  NotificationService.scheduleInAppReminder(
                    context: context,
                    title: "Time to fertilize ${plant.p_name}",
                    body: "Don't forget to feed your ${plant.p_name} 🌿",
                    delay: const Duration(seconds: 20), // Demo delay
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Fertilizer reminder set!")),
                  );
                } else {
                  // Logic to cancel reminder if needed
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Fertilizer reminder canceled.")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
