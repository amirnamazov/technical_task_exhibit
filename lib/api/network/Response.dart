class Response<T> {
  late T data;
  String? message;
  Status? status;

  Response.initial() : status = Status.INITIAL;
  Response.loading() : status = Status.LOADING;
  Response.completed(this.data) : status = Status.COMPLETED;
  Response.error(this.message) : status = Status.ERROR;

  @override
  String toString() => "Status : $status \n Message : $message \n Data : $data";
}

enum Status { LOADING, COMPLETED, ERROR, INITIAL }