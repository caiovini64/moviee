import 'failure.dart';

class ServerFailure extends Failure {
  String _message = 'Ops! Something wrong with the server.';
  String get message => _message;
  @override
  List<Object?> get props => [];
}
