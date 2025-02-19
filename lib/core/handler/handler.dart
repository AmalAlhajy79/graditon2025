

import 'dart:async';

// import 'package:e_library/core/network/exceptions.dart';

import '../data_state/data_state.dart';

Future<DataState<T>> handle<T>(FutureOr<T> Function() process)async{
  try{
    var result = await process();
    return DataState<T>(
      data: result,
      status: DataStatus.success
    );
  }catch(e){
    return DataState(
      status: DataStatus.error,
      message: e.toString()
    );
  }
}