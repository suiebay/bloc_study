import 'package:bloc/bloc.dart';
import 'package:test_bloc/logic/profile/data/models/profile.dart';
import 'package:test_bloc/logic/profile/data/repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc(this.profileRepository): super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if(event is LoadProfile) {
      yield ProfileLoading();
      try {
        final Profile profile = await profileRepository.getProfile();
        yield ProfileSuccess(profile);
      } catch (e) {
        yield ProfileFailure(e.toString());
      }
    }
  }

}