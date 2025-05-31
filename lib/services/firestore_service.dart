import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(
      String uid,
      String username,
      String email,
      ) async {
    try {
      // Guardar la información del usuario en Firestore
      await _firestore.collection('users').doc(uid).set({
        'username': username,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
      debugPrint('User data saved to Firestore');
    } catch (e) {
      debugPrint('Error saving user data: $e');
    }
  }
}