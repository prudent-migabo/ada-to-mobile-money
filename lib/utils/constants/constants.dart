import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

CollectionReference userRef = FirebaseFirestore.instance.collection('users');
CollectionReference coinRef = FirebaseFirestore.instance.collection('UsersCoins').doc(FirebaseAuth.instance.currentUser!.uid).collection('coins');
const kMainColor = Color(0xff1e6eb3);
const bold = TextStyle(fontWeight: FontWeight.bold);
const boldStyle = FontWeight.bold;
const whiteColor =  Colors.white;

const kStyleRecoveryPhrase = TextStyle(fontSize: 12, color: Colors.black);

TextStyle kGreyTextColor = TextStyle(color: Colors.grey[500]);