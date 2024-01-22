// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$escutAtom = Atom(name: 'ControllerBase.escut', context: context);

  @override
  int get escut {
    _$escutAtom.reportRead();
    return super.escut;
  }

  @override
  set escut(int value) {
    _$escutAtom.reportWrite(value, super.escut, () {
      super.escut = value;
    });
  }

  late final _$itemAtom = Atom(name: 'ControllerBase.item', context: context);

  @override
  String get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(String value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  void setItem(String valor) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setItem');
    try {
      return super.setItem(valor);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionar() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.adicionar');
    try {
      return super.adicionar();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
escut: ${escut},
item: ${item}
    ''';
  }
}
