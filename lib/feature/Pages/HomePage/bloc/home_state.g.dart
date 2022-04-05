// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final int selectedPage;

  factory _$HomeState([void Function(HomeStateBuilder)? updates]) =>
      (new HomeStateBuilder()..update(updates)).build();

  _$HomeState._({this.isSuccess, this.isLoading, required this.selectedPage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        selectedPage, 'HomeState', 'selectedPage');
  }

  @override
  HomeState rebuild(void Function(HomeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeStateBuilder toBuilder() => new HomeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        selectedPage == other.selectedPage;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode),
        selectedPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('selectedPage', selectedPage))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  int? _selectedPage;
  int? get selectedPage => _$this._selectedPage;
  set selectedPage(int? selectedPage) => _$this._selectedPage = selectedPage;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _selectedPage = $v.selectedPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeState;
  }

  @override
  void update(void Function(HomeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HomeState build() {
    final _$result = _$v ??
        new _$HomeState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            selectedPage: BuiltValueNullFieldError.checkNotNull(
                selectedPage, 'HomeState', 'selectedPage'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
