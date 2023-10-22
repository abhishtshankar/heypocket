// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:io';

Future genaratePDFInvoice(
  BuildContext context,
  String estimateNumber,
  String customerName,
  String paymentStatus,
) async {
  // Add your function code here!
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.TableHelper.fromTextArray(
          context: context,
          data: <List<String>>[
            <String>['Item', 'Price'],
            <String>['Item 1', '₹500'], // Use the Rupee symbol in your text
            <String>['Item 2', '₹750'], // Use the Rupee symbol in your text
          ],
          cellStyle: pw.TextStyle(
            fontSize: 16, // Adjust the font size as needed
          ),
          headerStyle: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            fontSize: 18, // Adjust the font size as needed
          ),
        );
      },
    ),
  );

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
