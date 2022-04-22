import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:send_mail/commen/util/exception/auth_failures.dart';
import 'package:send_mail/commen/util/exception/signup_failures.dart';
import 'package:send_mail/features/auth/domain/entities/utilisateur.dart';
import 'package:send_mail/features/auth/domain/interfaces/auth_interface.dart';
import 'package:send_mail/features/auth/infrastracture/data_sources/firebase_datasource.dart';

@Singleton(as: AuthInterface)
class AuthRepository implements AuthInterface {
  AuthRepository(this.dataSource);
  final FirebaseDataSource dataSource;
  bool isAuthenticated = false;
  Utilisateur? _user;

  final _controller = StreamController<Utilisateur?>.broadcast();

  @override
  Utilisateur? get currentUser => isAuthenticated ? _user : null;

  @override
  Stream<Utilisateur?> get user {
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
  Future<Either<AuthentificationFailure, bool>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    var _isLoggedIn = await dataSource.signInWithEmailAndPassword(
      email,
      password,
    );
    return _isLoggedIn.fold(
      (l) {
        return Left(l);
      },
      (r) {
        _controller.add(r);
        isAuthenticated = true;

        return const Right(true);
      },
    );
  }

  @override
  Future<bool> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<SignUpFailure, bool>> signUp(
      {required String email,
      required String password,
      required String name}) async {
    var _isLoggedIn = await dataSource.signUp(
      email,
      password,
      name,
    );
    return _isLoggedIn.fold(
      (l) {
        return Left(l);
      },
      (r) {
        debugPrint(r.toString());
        _controller.add(r);
        isAuthenticated = true;

        return const Right(true);
      },
    );
  }
}
