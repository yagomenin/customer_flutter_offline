abstract class Failure {
  Failure({required this.message});

  final String message;
}

class SaveErrorFailure extends Failure {
  SaveErrorFailure({required super.message});
}

class UpdateErrorFailure extends Failure {
  UpdateErrorFailure({required super.message});
}

class DeleteErrorFailure extends Failure {
  DeleteErrorFailure({required super.message});
}

class getDataErrorFailure extends Failure {
  getDataErrorFailure({required super.message});
}
