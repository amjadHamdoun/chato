// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prof_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProfState extends ProfState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final bool? isSuccessLogout;
  @override
  final bool? isLoadingLogout;
  @override
  final String? error;
  @override
  final File? img;
  @override
  final ProfileModel? profileModel;
  @override
  final CountFriendModel? countFriendModel;
  @override
  final BlockedUserModel? blockedUserModel;

  factory _$ProfState([void Function(ProfStateBuilder)? updates]) =>
      (new ProfStateBuilder()..update(updates)).build();

  _$ProfState._(
      {this.isSuccess,
      this.isLoading,
      this.isSuccessLogout,
      this.isLoadingLogout,
      this.error,
      this.img,
      this.profileModel,
      this.countFriendModel,
      this.blockedUserModel})
      : super._();

  @override
  ProfState rebuild(void Function(ProfStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfStateBuilder toBuilder() => new ProfStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        isSuccessLogout == other.isSuccessLogout &&
        isLoadingLogout == other.isLoadingLogout &&
        error == other.error &&
        img == other.img &&
        profileModel == other.profileModel &&
        countFriendModel == other.countFriendModel &&
        blockedUserModel == other.blockedUserModel;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, isSuccess.hashCode),
                                    isLoading.hashCode),
                                isSuccessLogout.hashCode),
                            isLoadingLogout.hashCode),
                        error.hashCode),
                    img.hashCode),
                profileModel.hashCode),
            countFriendModel.hashCode),
        blockedUserModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isSuccessLogout', isSuccessLogout)
          ..add('isLoadingLogout', isLoadingLogout)
          ..add('error', error)
          ..add('img', img)
          ..add('profileModel', profileModel)
          ..add('countFriendModel', countFriendModel)
          ..add('blockedUserModel', blockedUserModel))
        .toString();
  }
}

class ProfStateBuilder implements Builder<ProfState, ProfStateBuilder> {
  _$ProfState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isSuccessLogout;
  bool? get isSuccessLogout => _$this._isSuccessLogout;
  set isSuccessLogout(bool? isSuccessLogout) =>
      _$this._isSuccessLogout = isSuccessLogout;

  bool? _isLoadingLogout;
  bool? get isLoadingLogout => _$this._isLoadingLogout;
  set isLoadingLogout(bool? isLoadingLogout) =>
      _$this._isLoadingLogout = isLoadingLogout;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  File? _img;
  File? get img => _$this._img;
  set img(File? img) => _$this._img = img;

  ProfileModel? _profileModel;
  ProfileModel? get profileModel => _$this._profileModel;
  set profileModel(ProfileModel? profileModel) =>
      _$this._profileModel = profileModel;

  CountFriendModel? _countFriendModel;
  CountFriendModel? get countFriendModel => _$this._countFriendModel;
  set countFriendModel(CountFriendModel? countFriendModel) =>
      _$this._countFriendModel = countFriendModel;

  BlockedUserModel? _blockedUserModel;
  BlockedUserModel? get blockedUserModel => _$this._blockedUserModel;
  set blockedUserModel(BlockedUserModel? blockedUserModel) =>
      _$this._blockedUserModel = blockedUserModel;

  ProfStateBuilder();

  ProfStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isSuccessLogout = $v.isSuccessLogout;
      _isLoadingLogout = $v.isLoadingLogout;
      _error = $v.error;
      _img = $v.img;
      _profileModel = $v.profileModel;
      _countFriendModel = $v.countFriendModel;
      _blockedUserModel = $v.blockedUserModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfState;
  }

  @override
  void update(void Function(ProfStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfState build() {
    final _$result = _$v ??
        new _$ProfState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            isSuccessLogout: isSuccessLogout,
            isLoadingLogout: isLoadingLogout,
            error: error,
            img: img,
            profileModel: profileModel,
            countFriendModel: countFriendModel,
            blockedUserModel: blockedUserModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
