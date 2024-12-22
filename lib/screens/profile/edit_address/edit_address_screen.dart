// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:flutter/material.dart';
import 'address_widgets.dart';

class AddressEditScreen extends StatefulWidget {
  const AddressEditScreen({super.key});

  @override
  _AddressEditScreenState createState() => _AddressEditScreenState();
}

class _AddressEditScreenState extends State<AddressEditScreen> {
  List<Map<String, String>> addresses = [
    {'title': 'Home', 'address': '123 Main St, City, ZIP'},
    {'title': 'Office', 'address': '456 Office St, City, ZIP'},
  ];

  void _addNewAddress(String title, String address) {
    setState(() {
      addresses.add({'title': title, 'address': address});
    });
  }

  void _editAddress(int index, String title, String address) {
    setState(() {
      addresses[index] = {'title': title, 'address': address};
    });
  }

  void _deleteAddress(int index) {
    setState(() {
      addresses.removeAt(index);
    });
  }

  void _showAddAddressDialog() {
    String title = '';
    String address = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Address'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Address'),
                onChanged: (value) {
                  address = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty && address.isNotEmpty) {
                  _addNewAddress(title, address);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _selectAddress(String address) {
    Navigator.pop(context, address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Address')),
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return AddressWidget(
            title: addresses[index]['title']!,
            address: addresses[index]['address']!,
            onEdit: () {
              // Handle edit address logic
              // You can call _editAddress here if needed
            },
            onDelete: () {
              _deleteAddress(index);
            },
            onSelect: () {
              _selectAddress(addresses[index]['address']!);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddAddressDialog,
        label: const Text('Add New Address'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
