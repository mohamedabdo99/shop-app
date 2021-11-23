abstract class SearchStates{}

class InitialStateSearch extends SearchStates {}

class LoadingStateSearch extends SearchStates {}

class SuccessStateSearch extends SearchStates {}

class ErrorStateSearch extends SearchStates {
  final String error;

  ErrorStateSearch(this.error);
}