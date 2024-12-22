// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomerServiceChatScreen extends StatefulWidget {
  const CustomerServiceChatScreen({super.key});

  @override
  _CustomerServiceChatScreenState createState() => _CustomerServiceChatScreenState();
}

class _CustomerServiceChatScreenState extends State<CustomerServiceChatScreen> {
  List<Map<String, dynamic>> messages = [
    {'text': 'Hello, good morning', 'isUser': false},
    {'text': 'Hi, I\'m having problems with my order & payment.', 'isUser': true},
    {'text': 'Can you help me?', 'isUser': true},
    {'text': 'Of course.', 'isUser': false},
    {'text': 'Can you tell me the problem you are having? so I can help solve it.', 'isUser': false},
  ];

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Service'),
      ),
      body: Column(
        children: [
          Expanded(child: _buildChatMessages()),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildChatMessages() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        bool isUser = messages[index]['isUser'];
        return Align(
          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            decoration: BoxDecoration(
              color: isUser ? Colors.black : Colors.grey[300],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              messages[index]['text'],
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          ElevatedButton(
            onPressed: _sendMessage,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(16.0),
            ),
            child: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add({'text': _controller.text, 'isUser': true});
      });
      _controller.clear();
    }
  }
}
