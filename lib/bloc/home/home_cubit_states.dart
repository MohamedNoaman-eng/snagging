abstract class HomeCubitStates{}
 class InitialHomeState extends HomeCubitStates{}
 class ChangeIndexHomeState extends HomeCubitStates{}
 class GetServicesLoadingState extends HomeCubitStates{}
 class GetServicesSuccessfullyState extends HomeCubitStates{}
 class GetServicesErrorState extends HomeCubitStates{
  final String errorMessage;

  GetServicesErrorState(this.errorMessage);
 }
class GetTestimonialsLoadingState extends HomeCubitStates{}
class GetTestimonialsSuccessfullyState extends HomeCubitStates{}
class InternetConnectionLoadingState extends HomeCubitStates{}
class InternetConnectionSuccessState extends HomeCubitStates{}
class ChangeDisabledStateT extends HomeCubitStates{}
class ChangeDisabledState extends HomeCubitStates{}
class InternetConnectionFailedState extends HomeCubitStates{}
class GetTestimonialsErrorState extends HomeCubitStates{
 final String errorMessage;

 GetTestimonialsErrorState(this.errorMessage);
}
class ChangePageIndexState extends HomeCubitStates{}
class GetPackagesLoadingState extends HomeCubitStates{}
class GetPackagesSuccessfullyState extends HomeCubitStates{}
class GetPackagesErrorState extends HomeCubitStates{
 final String errorMessage;

 GetPackagesErrorState(this.errorMessage);
}
