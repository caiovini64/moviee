import 'failure.dart';

class SignupFailure extends Failure {
  final String _message = 'Ops! Something wrong, try again.';
  String get message => _message;

  @override
  List<Object?> get props => [];
}
