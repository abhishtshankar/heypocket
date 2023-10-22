import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double? poPrice(
  double sellingPrice,
  int? quantity,
) {
  // itemPrice muliplied with quantity
  if (quantity == null) {
    return null;
  }
  return sellingPrice * quantity;
}

String? calander(DateTime? date) {
  // disable future dates in date picker, only show till current date
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final selectedDate = date ?? today;
  if (selectedDate.isBefore(today)) {
    return DateFormat('yyyy-MM-dd').format(today);
  }
  return DateFormat('yyyy-MM-dd').format(selectedDate);
}

double calculateTotalPrice(List<dynamic> cartItems) {
  // how to get total price in list of document reference
  double totalPrice = 0.0;

  for (DocumentReference item in cartItems) {
    item.get().then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        double price = data['price'] ?? 0.0;
        totalPrice += price;
      }
    });
  }

  return totalPrice;
}

String? calculateTotalQuantity(double? units) {
  int calculateTotalQty(List<MaterialLibraryRecord> materialList) {
    int totalQty = 0;
    for (var item in materialList) {
      totalQty += item.units as int;
    }
    return totalQty;
  }
}

double? totalSum(double? price) {
  // total sum from all the price feild
  double? sum = 0.0;
  if (price != null) {
    sum += price;
  }
  return sum;
}

double invoicesTotalPrice(DocumentReference invoices) {
  // calculate total price of an invoices collection in the collection take price, discount
  double totalPrice = 0.0;
  invoices.collection('invoices').get().then((querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      double price = doc.get('price');
      double discount = doc.get('discount');
      totalPrice += price - discount;
    });
  });
  return totalPrice;
}

DateTime? getAttendance(
  DateTime? markedAttendance,
  DateTime? currentDate,
) {
  // dislpay the string only based on the marked boolean and the current time stramp
  if (markedAttendance == null) {
    return null;
  }

  final now = currentDate ?? DateTime.now();

  final difference = now.difference(markedAttendance);

  if (difference.inMinutes < 1) {
    return markedAttendance;
  } else if (difference.inHours < 1) {
    return markedAttendance.add(Duration(minutes: 1));
  } else if (difference.inDays < 1) {
    return markedAttendance.add(Duration(hours: 1));
  } else {
    return null;
  }
}

List<DocumentReference> getDropdownValues(
  List<DocumentReference> attendanceList,
  List<DocumentReference> staffList,
) {
  List<DocumentReference> updatedStaffList = [...staffList];

  for (DocumentReference attendanceReference in attendanceList) {
    if (!updatedStaffList.contains(attendanceReference)) {
      updatedStaffList.add(attendanceReference);
    }
  }

  return updatedStaffList;
}

List<String> getChatUserList(
  String user1,
  String user2,
) {
  return [user1, user2];
}

String getOtherUser(
  List<String> usersList,
  String authUser,
) {
  return usersList.first == authUser ? usersList.last : usersList.first;
}
