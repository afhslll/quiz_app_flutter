import 'package:flutter/material.dart';
import 'package:quiz_app/core/enum/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState? _viewState;
  ViewState? get viewState => _viewState;

  bool disposed = false;

  void setViewState(ViewState viewState) {
    _viewState = viewState;
    if (disposed) return;
    notifyListeners();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}
