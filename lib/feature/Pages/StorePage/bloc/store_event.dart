import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StoreEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ChangePageEvent extends StoreEvent{
   int pageNumber;
   ChangePageEvent(this.pageNumber);
}

