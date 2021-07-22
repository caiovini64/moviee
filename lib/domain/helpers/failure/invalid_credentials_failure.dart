import 'failure.dart';

class InvalidCredentialsFailure extends Failure {
  final String _message = 'Invalid credentials. Try again!';
  String get message => _message;
  @override
  List<Object?> get props => [];
}
