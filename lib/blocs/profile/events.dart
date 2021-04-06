import 'package:equatable/equatable.dart';

/// Events for the [ProfileBloc] bloc
abstract class ProfileEvent extends Equatable {

  const ProfileEvent();

  @override
  List<Object> get props => [];
}

/// Profile is being configured
class ProfileConfiguration extends ProfileEvent {
  const ProfileConfiguration();
}

/// Profile configuration requirements not met
class ProfileIncomplete extends ProfileEvent {
  const ProfileIncomplete();
}

