

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

class ApplyFormPage extends StatefulWidget {
  final String tabName;
  final String selectedCollege;
  final String studentId;

  ApplyFormPage({
    required this.tabName,
    required this.selectedCollege,
    required this.studentId,
  });

  @override
  _ApplyFormPageState createState() => _ApplyFormPageState();
}

class _ApplyFormPageState extends State<ApplyFormPage> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController jobRoleController = TextEditingController();
  TextEditingController jobLocationController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();

  File? resumeFile; // Variable to store resume file
  String? resumeFileName; // Variable to store resume file name

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Text(
            'Application',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Card(
              color: Colors.greenAccent[100],
              elevation: 12.0, // Add elevation for shadow effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Fill the Application',
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.0), // Increased space for better separation
                    _buildTextField(companyNameController, 'Company Name'),
                    SizedBox(height: 16.0),
                    _buildTextField(jobRoleController, 'Job Role'),
                    SizedBox(height: 16.0),
                    _buildTextField(jobLocationController, 'Job Location'),
                    SizedBox(height: 16.0),
                    _buildTextField(jobDescriptionController, 'Job Description'),
                    SizedBox(height: 32.0), // Increased space for better separation
                    resumeFileName != null
                        ? Center(
                      child: Text(
                        'Selected Resume: $resumeFileName',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold, // Making the text bold
                        ),
                      ),
                    )
                        : Container(),
                    SizedBox(height: 12.0),
                    Center(
                      child: _buildUploadButton(),
                    ),
                    SizedBox(height: 24.0), // Increased space for better separation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildClearFormButton(),
                        _buildSubmitButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        controller: controller,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          labelText: label,
          labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
          ),
        ),
        validator: (value) => _validateField(value),
      ),
    );
  }

  Widget _buildUploadButton() {
    return ElevatedButton.icon(
      onPressed: () async {
        resumeFile = await _selectResume(context);
        if (resumeFile != null) {
          resumeFileName = resumeFile!.path.split('/').last;
        }
      },
      icon: Icon(Icons.attach_file),
      label: Text(
        'Attach Resume',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.green[400], // Background color
        onPrimary: Colors.white,    // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 24.0,
        ),
        // Set minimum width for button
        minimumSize: Size(200, 40),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          if (resumeFile == null) {
            ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                children: [  Text("Please attach your resume"),  ],   ),    ),  );
            return;
          }
          _showConfirmationDialog(context);
        }
      },
      child: Text(
        'Submit',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // Background color
        onPrimary: Colors.white,    // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 24.0,
        ),
        // Set minimum width for button
        minimumSize: Size(140, 25),
      ),
    );
  }

  Widget _buildClearFormButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          companyNameController.clear();
          jobRoleController.clear();
          jobLocationController.clear();
          jobDescriptionController.clear();
          resumeFile = null;
          resumeFileName = null;
        });
      },
      child: Text(
        'Clear Form',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.orangeAccent,  // Background color
        onPrimary: Colors.black87,   // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 24.0,
        ),
        // Set minimum width for button
        minimumSize: Size(25, 25),
      ),
    );
  }

  Future<File?> _selectResume(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        resumeFile = File(result.files.single.path!);
      });
      return resumeFile;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No resume selected')));
      return null;
    }
  }

  // Future<void> _uploadResume(File resumeFile) async {
  //   // Upload file to Firebase Storage and get the URL
  //   // Implement Firebase Storage upload here and return the URL
  //   // Placeholder code:
  //   String resumeUrl = 'https://example.com/resume.pdf';
  //
  //   DocumentReference documentReference = FirebaseFirestore.instance
  //       .collection('College Mate')
  //       .doc('Institution')
  //       .collection('Colleges')
  //       .doc(widget.selectedCollege)
  //       .collection('STUDENT')
  //       .doc(widget.studentId)
  //       .collection('Applied Opportunity')
  //       .doc();
  //
  //   await documentReference.set({
  //     'companyName': companyNameController.text,
  //     'jobRole': jobRoleController.text,
  //     'jobLocation': jobLocationController.text,
  //     'jobDescription': jobDescriptionController.text,
  //     'resumeUrl': resumeUrl,
  //     'timestamp': FieldValue.serverTimestamp(),
  //   });
  //
  //   _showSuccessDialog(context);
  // }

  Future<void> _uploadResume(File resumeFile) async {
    // Upload file to Firebase Storage and get the URL
    // Implement Firebase Storage upload here and return the URL
    // Placeholder code:
    String resumeUrl = 'https://example.com/resume.pdf';

    // Generate unique document IDs
    String studentDocId = FirebaseFirestore.instance.collection('College Mate')
        .doc('Institution')
        .collection('Colleges')
        .doc(widget.selectedCollege)
        .collection('STUDENT')
        .doc(widget.studentId)
        .id;

    String appliedOpportunityDocId = FirebaseFirestore.instance
        .collection('College Mate')
        .doc('Institution')
        .collection('Colleges')
        .doc(widget.selectedCollege)
        .collection('STUDENT')
        .doc(widget.studentId)
        .collection('Applied Opportunity')
        .doc()
        .id;

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('College Mate')
        .doc('Institution')
        .collection('Colleges')
        .doc(widget.selectedCollege)
        .collection('STUDENT')
        .doc(widget.studentId)
        .collection('Applied Opportunity')
        .doc(appliedOpportunityDocId);

    await documentReference.set({
      'companyName': companyNameController.text,
      'jobRole': jobRoleController.text,
      'jobLocation': jobLocationController.text,
      'jobDescription': jobDescriptionController.text,
      'resumeUrl': resumeUrl,
      'timestamp': FieldValue.serverTimestamp(),
    });

    _showSuccessDialog(context);
  }

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    bool result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Submission'),
          content: Text('Are you sure you want to submit this form?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (result) {
      _uploadResume(resumeFile!);
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,  // Set to false to prevent dismissal by tapping outside
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => Future.value(false),  // Prevent dialog from closing when back button is pressed
          child: AlertDialog(
            title: Text('Success'),
            content: Text('Your application has been submitted successfully.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();  // Close the dialog
                  _clearForm();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _clearForm() {
    setState(() {
      companyNameController.clear();
      jobRoleController.clear();
      jobLocationController.clear();
      jobDescriptionController.clear();
      resumeFile = null;
      resumeFileName = null;
    });
  }
}
