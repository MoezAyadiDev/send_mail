import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:send_mail/features/auth/domain/entities/user.dart';
import 'package:send_mail/features/auth/domain/interfaces/auth_interface.dart';
import 'package:send_mail/features/auth/infrastracture/data_sources/firebase_datasource.dart';

@Singleton(as: AuthInterface)
class AuthRepository implements AuthInterface {
  AuthRepository(this.dataSource);
  final FirebaseDataSource dataSource;
  bool isAuthenticated = false;
  User? _user;

  final _controller = StreamController<User?>.broadcast();

  @override
  User? get currentUser => isAuthenticated ? _user : null;

  @override
  Stream<User?> get user {
    return _controller.stream.asBroadcastStream(
      onListen: (_) {
        _controller.add(isAuthenticated ? _user : null);
      },
    );
  }

  @override
  Future<bool> logOut() {
    _controller.add(null);
    isAuthenticated = false;
    return Future.value(true);
  }

  @override
  Future<bool> mailVerificationPage() {
    // TODO: implement mailVerificationPage
    throw UnimplementedError();
  }

  @override
  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    debugPrint('signInWithEmailAndPassword');
    var _isLoggedIn =
        await dataSource.signInWithEmailAndPassword(email, password);
    if (_isLoggedIn) {
      _controller.add(_fakeUser);
      isAuthenticated = true;

      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<bool> signUp({required String email, required String password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}

User get _fakeUser => User('moez.ayadi@gmail.com', 'AZERTY');
