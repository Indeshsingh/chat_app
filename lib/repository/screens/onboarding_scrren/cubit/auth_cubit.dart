// auth_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  AuthCubit() : super(AuthInitial());

  void sendOTP(String phoneNumber) async {
    emit(AuthLoading());

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        emit(AuthLoggedIn(user: _auth.currentUser!));
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(AuthError(message: e.message ?? "Verification failed"));
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        emit(OTPSent());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  void verifyOTP(String otp) async {
    emit(AuthLoading());
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
      emit(AuthLoggedIn(user: _auth.currentUser!));
    } catch (e) {
      emit(AuthError(message: "Invalid OTP"));
    }
  }

  void logout() async {
    await _auth.signOut();
    emit(AuthInitial());
  }
}
