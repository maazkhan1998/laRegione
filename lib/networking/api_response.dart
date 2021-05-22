class ApiResponse<T> {
  Status apiStatus;

  T data;

  String message;

  bool isConsumed = false;


  ApiResponse.loading(this.message) : apiStatus = Status.LOADING;

  ApiResponse.completed(this.data) : apiStatus = Status.COMPLETED;

  ApiResponse.error(this.message) : apiStatus = Status.ERROR;

  @override
  String toString() {
    return "Status : $apiStatus \n Message : $message \n Data : $data";
  }
}

enum Status {  LOADING, COMPLETED, ERROR }
