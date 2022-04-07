import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RoomEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ChangeFilterEvent extends RoomEvent{
   int selectFilter;
   ChangeFilterEvent(this.selectFilter);
}

