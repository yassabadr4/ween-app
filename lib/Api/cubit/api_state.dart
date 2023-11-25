part of 'api_cubit.dart';

@immutable
abstract class ApiState {}

class ApiInitial extends ApiState {}
class ApiLoading extends ApiState {}
class ApiSuccess extends ApiState {}
class ApiError extends ApiState {
  final String errMessage;

  ApiError(this.errMessage);
}
