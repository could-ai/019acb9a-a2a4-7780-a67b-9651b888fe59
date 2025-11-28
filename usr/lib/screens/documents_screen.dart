import 'package:flutter/material.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  // Mock data for documents
  final List<Map<String, dynamic>> _documents = [
    {
      'title': 'Exame de Sangue - João Silva',
      'type': 'Laboratório',
      'date': '12/05/2024',
      'icon': Icons.science,
      'color': Colors.blue,
    },
    {
      'title': 'Raio-X Torax - Maria Oliveira',
      'type': 'Imagem',
      'date': '10/05/2024',
      'icon': Icons.image,
      'color': Colors.purple,
    },
    {
      'title': 'Prescrição - Carlos Santos',
      'type': 'Receita',
      'date': '08/05/2024',
      'icon': Icons.medical_services,
      'color': Colors.green,
    },
    {
      'title': 'Relatório Cardíaco - Ana Costa',
      'type': 'Relatório',
      'date': '05/05/2024',
      'icon': Icons.description,
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documentos Médicos'),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar documentos...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          
          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildFilterChip('Todos', true),
                _buildFilterChip('Exames', false),
                _buildFilterChip('Receitas', false),
                _buildFilterChip('Relatórios', false),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Document List
          Expanded(
            child: ListView.builder(
              itemCount: _documents.length,
              itemBuilder: (context, index) {
                final doc = _documents[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: (doc['color'] as Color).withOpacity(0.1),
                      child: Icon(doc['icon'] as IconData, color: doc['color'] as Color),
                    ),
                    title: Text(
                      doc['title'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${doc['type']} • ${doc['date']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                    onTap: () {
                      // Open document details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Funcionalidade de upload em breve')),
          );
        },
        label: const Text('Novo Documento'),
        icon: const Icon(Icons.upload_file),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool value) {},
        backgroundColor: Colors.white,
        selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
        labelStyle: TextStyle(
          color: isSelected ? Theme.of(context).primaryColor : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
