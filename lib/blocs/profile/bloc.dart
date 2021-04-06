import 'package:f_date/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'states.dart';

/// Not sure this needs to be stateful

/// Manages Profile State of the App
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;
  ProfileBloc(this.userRepository) : super(ProfileConfigurationInit());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    // if (event is )
    throw UnimplementedError();
  }
}
