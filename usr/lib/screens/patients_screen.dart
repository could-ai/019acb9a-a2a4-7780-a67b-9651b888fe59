import 'package:flutter/material.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> patients = [
      {'name': 'João Silva', 'age': '45 anos', 'lastVisit': '12/05/2024'},
      {'name': 'Maria Oliveira', 'age': '32 anos', 'lastVisit': '10/05/2024'},
      {'name': 'Carlos Santos', 'age': '28 anos', 'lastVisit': '08/05/2024'},
      {'name': 'Ana Costa', 'age': '55 anos', 'lastVisit': '05/05/2024'},
      {'name': 'Pedro Souza', 'age': '61 anos', 'lastVisit': '02/05/2024'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pacientes'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: patients.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final patient = patients[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal.shade100,
              child: Text(
                patient['name']!.substring(0, 1),
                style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              patient['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${patient['age']} • Última consulta: ${patient['lastVisit']}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to patient details
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
