// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'regis_cubit.dart';

@immutable
abstract class RegisState {}

class RegisInitial extends RegisState {}
class RegisLoading extends RegisState {}
class RegisSuccess extends RegisState {}
class RegisFailure extends RegisState {

  final String errorMessage ;
  RegisFailure({
    required this.errorMessage,
  });
}
