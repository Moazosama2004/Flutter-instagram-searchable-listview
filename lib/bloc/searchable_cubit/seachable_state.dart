part of 'seachable_cubit.dart';

@immutable
sealed class SeachableState {}

final class SeachableInitial extends SeachableState {}

final class SeachableEmpty extends SeachableState {}

final class Seachablefollow extends SeachableState {}

final class SeachableSearch extends SeachableState {}

final class SeachableLoaded extends SeachableState {}



