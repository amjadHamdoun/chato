// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RoomState extends RoomState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final int selectedFilter;

  factory _$RoomState([void Function(RoomStateBuilder)? updates]) =>
      (new RoomStateBuilder()..update(updates)).build();

  _$RoomState._({this.isSuccess, this.isLoading, required this.selectedFilter})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        selectedFilter, 'RoomState', 'selectedFilter');
  }

  @override
  RoomState rebuild(void Function(RoomStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoomStateBuilder toBuilder() => new RoomStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoomState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        selectedFilter == other.selectedFilter;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode),
        selectedFilter.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RoomState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('selectedFilter', selectedFilter))
        .toString();
  }
}

class RoomStateBuilder implements Builder<RoomState, RoomStateBuilder> {
  _$RoomState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  int? _selectedFilter;
  int? get selectedFilter => _$this._selectedFilter;
  set selectedFilter(int? selectedFilter) =>
      _$this._selectedFilter = selectedFilter;

  RoomStateBuilder();

  RoomStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _selectedFilter = $v.selectedFilter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoomState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RoomState;
  }

  @override
  void update(void Function(RoomStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RoomState build() {
    final _$result = _$v ??
        new _$RoomState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            selectedFilter: BuiltValueNullFieldError.checkNotNull(
                selectedFilter, 'RoomState', 'selectedFilter'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
