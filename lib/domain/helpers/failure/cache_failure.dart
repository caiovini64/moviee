import 'failure.dart';

class CacheFailure extends Failure {
  final String _message = 'Ops, No Internet Connection';
  String get message => _message;

  @override
  List<Object?> get props => [];
}
