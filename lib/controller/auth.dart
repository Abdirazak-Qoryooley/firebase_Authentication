// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

import '../services/services.dart';

class AuthController extends GetxController {
  final FirebaseAuthServices _authService = FirebaseAuthServices();

  Future<void> signUp({required String email, required String password, }) async {
    await _authService.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }


  Future<void> SigIn({required String email, required String password})async{
    await _authService.signInWithEmailAndPassword(email: email, password: password);
  }
}