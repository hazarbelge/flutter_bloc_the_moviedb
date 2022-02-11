import 'dart:convert';

class SessionId {
  const SessionId({
    required this.success,
    required this.guestSessionId,
    required this.expiresAt,
  });

  factory SessionId.fromRawJson(String str) => SessionId.fromJson(json.decode(str));

  factory SessionId.fromJson(Map<String, dynamic> json) => SessionId(
        success: json["success"],
        guestSessionId: json["guest_session_id"],
        expiresAt: json["expires_at"],
      );

  final bool success;
  final String guestSessionId;
  final String expiresAt;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => <String, dynamic>{
        "success": success,
        "guest_session_id": guestSessionId,
        "expires_at": expiresAt,
      };
}
