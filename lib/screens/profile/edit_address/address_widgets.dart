import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final String title;
  final String address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSelect;

  const AddressWidget({
    super.key,
    required this.title,
    required this.address,
    required this.onEdit,
    required this.onDelete,
    required this.onSelect,
  });

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Address'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: title),
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: TextEditingController(text: address),
                decoration: const InputDecoration(labelText: 'Address'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onDelete();
              },
              child: const Text('Discard'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                onEdit();
              },
              child: const Text('Keep'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: const Icon(Icons.location_on),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(address),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => _showEditDialog(context),
        ),
        onTap: onSelect,
      ),
    );
  }
}
