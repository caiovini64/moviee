import 'failure.dart';

class FirebaseFailure extends Failure {
  final String _message = 'Ops! Something wrong with the server.';
  String get message => _message;

  @override
  List<Object?> get props => [];
}
