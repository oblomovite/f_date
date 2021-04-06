import 'package:equatable/equatable.dart';

/// States emitted by [ProfileBloc]
abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}


/// Initialize profile configuration
class ProfileConfigurationInit extends ProfileState {
  const ProfileConfigurationInit();
}

/// Profile configurations completed
class ProfileConfigurationsSuccess extends ProfileState {
  const ProfileConfigurationsSuccess();
}

/// Profile configurations produced error or incomplete
class ProfileConfigurationFailure extends ProfileState {
  const ProfileConfigurationFailure();
}

/// Profile configuration changes pending
class ProfileConfigurationPending extends ProfileState {
  const ProfileConfigurationPending();
}
