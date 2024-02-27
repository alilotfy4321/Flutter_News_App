import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'textfeildcubit_state.dart';

class TextfeildcubitCubit extends Cubit<TextfeildcubitState> {
  TextfeildcubitCubit() : super(TextfeildcubitInitial());

  bool is_Password = false;
  bool obsecureText = false;
  Icon suffex = Icon(Icons.visibility);
  static TextfeildcubitCubit get(context) => BlocProvider.of(context);

  void changesuffix() {
    is_Password = !is_Password;
    obsecureText = !obsecureText;
    if (is_Password) {
      suffex = Icon(Icons.visibility_off);
    } else {
      suffex = Icon(Icons.visibility);
    }

    emit(TextfeildcubitChange());
  }

  validate(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
