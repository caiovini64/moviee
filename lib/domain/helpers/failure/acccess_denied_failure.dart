import 'failure.dart';

class AccesDeniedFailure extends Failure {
  final String _message = 'You don\'t have access!';
  String get message => _message;

  @override
  List<Object?> get props => [];
}
