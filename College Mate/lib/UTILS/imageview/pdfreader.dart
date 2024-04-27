import 'package:flutter/material.dart';
import 'package:college_mate/UTILS/constants/colors.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReader extends StatefulWidget {
  @override
  _PdfReaderState createState() => _PdfReaderState();
}

class _PdfReaderState extends State<PdfReader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: 25,
        child: Center(
          child: Icon(
            Icons.download_outlined,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      body: Container(
        child: SfPdfViewer.asset("assets/pdf/hmi.pdf"),
      ),
    );
  }
}
