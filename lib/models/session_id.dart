import 'dart:convert';
import 'package:equatable/equatable.dart';

class SessionId extends Equatable {
  SessionId({
    this.success,
    this.guestSessionId,
    this.expiresAt,
  });

  final bool success;
  final String guestSessionId;
  final String expiresAt;

  factory SessionId.fromRawJson(String str) =>
      SessionId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SessionId.fromJson(Map<String, dynamic> json) => SessionId(
        success: json["success"],
        guestSessionId: json["guest_session_id"],
        expiresAt: json["expires_at"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "guest_session_id": guestSessionId,
        "expires_at": expiresAt,
      };

  @override
  List<Object> get props => [
        success,
        guestSessionId,
      ];
}
