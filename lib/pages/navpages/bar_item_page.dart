import 'dart:async';
import 'package:flutter/material.dart';

class BarItemPage extends StatefulWidget {
  const BarItemPage({super.key});

  @override
  _BarItemPageState createState() => _BarItemPageState();
}

class _BarItemPageState extends State<BarItemPage> {
  final StreamController<Map<String, double?>> _dataController = StreamController<Map<String, double?>>();

  @override
  void initState() {
    super.initState();

    // Simular datos usando Stream.periodic
    Stream.periodic(const Duration(seconds: 1), (count) {
      return {
        'temperature': 20.0 + (10.0 * (count % 10) / 10),
        'humidity': 50.0 + (10.0 * (count % 10) / 10),
      };
    }).listen((data) {
      _dataController.add(data);
    });
  }

  @override
  void dispose() {
    _dataController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature and Humidity'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: StreamBuilder<Map<String, double?>>(
        stream: _dataController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final data = snapshot.data;
          final temperature = data?['temperature'];
          final humidity = data?['humidity'];

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildInfoCard(
                  icon: Icons.thermostat_outlined,
                  label: 'Temperature',
                  value: temperature != null ? '${temperature.toStringAsFixed(1)} °C' : 'Loading...',
                  onTap: () => _showDetailDialog('Temperature', temperature != null ? '${temperature.toStringAsFixed(1)} °C' : 'Loading...'),
                ),
                const SizedBox(height: 20),
                _buildInfoCard(
                  icon: Icons.opacity,
                  label: 'Humidity',
                  value: humidity != null ? '${humidity.toStringAsFixed(1)} %' : 'Loading...',
                  onTap: () => _showDetailDialog('Humidity', humidity != null ? '${humidity.toStringAsFixed(1)} %' : 'Loading...'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 6,
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          contentPadding: const EdgeInsets.all(20.0),
          leading: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.blueAccent.withOpacity(0.1),
            child: Icon(icon, size: 35, color: Colors.blueAccent),
          ),
          title: Text(label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black87)),
          trailing: Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black54)),
        ),
      ),
    );
  }

  void _showDetailDialog(String title, String value) {
    showDialog(
      context: context,
      barrierDismissible: true, // Cierra el diálogo al tocar fuera de él
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 6,
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Icon(
                  title == 'Temperature' ? Icons.thermostat_outlined : Icons.opacity,
                  size: 120,
                  color: Colors.blueAccent,
                ),
                const SizedBox(height: 20),
                Text(
                  value,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close', style: TextStyle(color: Colors.blueAccent, fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
