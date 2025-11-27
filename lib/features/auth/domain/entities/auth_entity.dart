import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';

@freezed
class AuthEntity with _$AuthEntity {
  const factory AuthEntity.authenticated() = _Authenticated;
  const factory AuthEntity.unauthenticated() = _Unauthenticated;
}
