abstract class SocialStates{}

class SocialInitialState extends SocialStates{}

class SocialGetUserLoadingState extends SocialStates{}

class SocialGetUserSuccessState extends SocialStates{}

class SocialGetUserErrorState extends SocialStates{
  final String error;

  SocialGetUserErrorState(this.error);
}

class SocialChangeBottomNavigationState extends SocialStates{}

class SocialNewPostState extends SocialStates{}

class SocialAddProfileImageSuccessState extends SocialStates{}

class SocialAddProfileImageErrorState extends SocialStates{}

class SocialAddCoverImageSuccessState extends SocialStates{}

class SocialAddCoverImageErrorState extends SocialStates{}

class SocialUpdateProfileImageSuccessState extends SocialStates{}

class SocialUpdateProfileImageErrorState extends SocialStates{}

class SocialUpdateCoverImageSuccessState extends SocialStates{}

class SocialUpdateCoverImageErrorState extends SocialStates{}

class SocialUpdateUserErrorState extends SocialStates{}

class SocialUpdateUserLoadingState extends SocialStates{}







