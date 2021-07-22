import 'failure.dart';

class UnexpectedFailure extends Failure {
  final String _message = 'Unexpected failure. Try again!';
  String get message => _message;
  @override
  List<Object?> get props => [];
}
