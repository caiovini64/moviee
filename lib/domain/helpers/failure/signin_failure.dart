import 'failure.dart';

class SigninFailure extends Failure {
  final String _message = 'Ops! Something wrong, try again.';
  String get message => _message;

  @override
  List<Object?> get props => [];
}
