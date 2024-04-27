import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataUploadScreen extends StatefulWidget {
  @override
  _DataUploadScreenState createState() => _DataUploadScreenState();
}

class _DataUploadScreenState extends State<DataUploadScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _dataController = TextEditingController();
  String _selectedRole = 'All';
  String _selectedBranch = 'AIDS';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Upload')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedRole,
                items: ['All', 'ATRANG', 'Events', 'Fests', 'NSS', 'REVIVE', 'RESONANCE']
                    .map((role) => DropdownMenuItem(
                  child: Text(role),
                  value: role,
                ))
                    .toList(),
                decoration: InputDecoration(labelText: 'Select Role'),
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedBranch,
                items: ['AIDS', 'Civil', 'Computer', 'EXTC', 'IT', 'Mechanic', 'Mechatronics']
                    .map((branch) => DropdownMenuItem(
                  child: Text(branch),
                  value: branch,
                ))
                    .toList(),
                decoration: InputDecoration(labelText: 'Select Branch'),
                onChanged: (value) {
                  setState(() {
                    _selectedBranch = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _dataController,
                decoration: InputDecoration(labelText: 'Enter Data'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some data';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    uploadData();
                  }
                },
                child: Text('Upload Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadData() async {
    try {
      await _firestore.collection(_selectedRole).doc(_selectedBranch).set({
        'data': _dataController.text,
        'timestamp': Timestamp.now(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data uploaded successfully')),
      );
      _dataController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload data')),
      );
    }
  }

  @override
  void dispose() {
    _dataController.dispose();
    super.dispose();
  }
}
