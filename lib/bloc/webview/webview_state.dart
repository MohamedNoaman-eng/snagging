abstract class WebViewCubitStates{}
class InitialWebViewState extends WebViewCubitStates{}
class ChangeProgressWebViewState extends WebViewCubitStates{}
class CheckInternetBookingLoadingState extends WebViewCubitStates{}
class CheckInternetBookingSuccessfullyState extends WebViewCubitStates{}
class CheckInternetBookingErrorState extends WebViewCubitStates{
}
class CheckInternetLoginLoadingState extends WebViewCubitStates{}
class CheckInternetLoginSuccessfullyState extends WebViewCubitStates{}
class CheckInternetLoginErrorState extends WebViewCubitStates{
}
// class GetTestimonialsLoadingState extends HomeCubitStates{}
// class GetTestimonialsSuccessfullyState extends HomeCubitStates{}
// class GetTestimonialsErrorState extends HomeCubitStates{
//   final String errorMessage;
//
//   GetTestimonialsErrorState(this.errorMessage);
// }