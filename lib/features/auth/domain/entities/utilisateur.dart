import 'package:freezed_annotation/freezed_annotation.dart';

part 'utilisateur.freezed.dart';
part 'utilisateur.g.dart';

@freezed
abstract class Utilisateur with _$Utilisateur {
  factory Utilisateur(
    String uid,
    String name,
    String email,
  ) = _Utilisateur;

  factory Utilisateur.fromJson(Map<String, Object?> json) =>
      _$UtilisateurFromJson(json);
}
