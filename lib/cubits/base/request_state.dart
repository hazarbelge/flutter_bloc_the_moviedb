import 'package:flutter/foundation.dart';

enum RequestStatus { init, loading, loaded, error }

@immutable
class RequestState<T> {
  const RequestState._({
    required this.status,
    this.value,
    this.errorMessage,
  });

  factory RequestState.fromJson(Map<String, dynamic> json) {
    return RequestState<T>._(
      status: RequestStatus.values[json['status']],
      value: json['value'],
      errorMessage: json['errorMessage'],
    );
  }

  const RequestState.init()
      : this._(
          status: RequestStatus.init,
        );

  const RequestState.loading([T? previousValue])
      : this._(
          value: previousValue,
          status: RequestStatus.loading,
        );

  const RequestState.loaded(T data)
      : this._(
          status: RequestStatus.loaded,
          value: data,
        );

  const RequestState.error(String error)
      : this._(
          status: RequestStatus.error,
          errorMessage: error,
        );

  final RequestStatus status;
  final T? value;
  final String? errorMessage;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status.index,
      'value': value,
      'errorMessage': errorMessage,
    };
  }

  @override
  String toString() => '($status: $value, $errorMessage)';
}
