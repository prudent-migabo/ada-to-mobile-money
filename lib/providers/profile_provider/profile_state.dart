import 'package:crypto_mob_app/models/models.dart';

enum ProfileStatus{
  initial,
  isLoading,
  isLoaded,
  error,
}

class ProfileState{
  ProfileStatus profileStatus;
  CustomError? error;

  ProfileState({
    required this.profileStatus,
    this.error,
  });

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    CustomError? error,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      error: error ?? this.error,
    );
  }

  factory ProfileState.init(){
    return ProfileState(profileStatus: ProfileStatus.initial);
  }

}