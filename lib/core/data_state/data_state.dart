
part 'data_status.dart';


class DataState<T> {

  final T? data;
  final String message;
  final DataStatus status;

  const DataState({
    this.data,
    this.message = '',
    this.status = DataStatus.init
  });

  @override
  String toString() {
    return """DataState<$T>
status : $status
data : $data
message : $message    
""";
  }

}
