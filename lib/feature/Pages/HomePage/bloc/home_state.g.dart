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
  final bool? isSuccessGetAllFriend;
  @override
  final bool? isLoadingGetAllFriend;
  @override
  final bool? isSuccessSearch;
  @override
  final bool? isLoadingSearch;
  @override
  final String error;
  @override
  final int selectedPage;
  @override
  final FriendshipRequestsModel friendshipRequestsModel;
  @override
  final SearchFriendModel searchFriendModel;
  @override
  final AllFriendModel allFriendModel;

  factory _$HomeState([void Function(HomeStateBuilder)? updates]) =>
      (new HomeStateBuilder()..update(updates)).build();

  _$HomeState._(
      {this.isSuccess,
      this.isLoading,
      this.isSuccessGetAllFriend,
      this.isLoadingGetAllFriend,
      this.isSuccessSearch,
      this.isLoadingSearch,
      required this.error,
      required this.selectedPage,
      required this.friendshipRequestsModel,
      required this.searchFriendModel,
      required this.allFriendModel})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(error, 'HomeState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        selectedPage, 'HomeState', 'selectedPage');
    BuiltValueNullFieldError.checkNotNull(
        friendshipRequestsModel, 'HomeState', 'friendshipRequestsModel');
    BuiltValueNullFieldError.checkNotNull(
        searchFriendModel, 'HomeState', 'searchFriendModel');
    BuiltValueNullFieldError.checkNotNull(
        allFriendModel, 'HomeState', 'allFriendModel');
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
        isSuccessGetAllFriend == other.isSuccessGetAllFriend &&
        isLoadingGetAllFriend == other.isLoadingGetAllFriend &&
        isSuccessSearch == other.isSuccessSearch &&
        isLoadingSearch == other.isLoadingSearch &&
        error == other.error &&
        selectedPage == other.selectedPage &&
        friendshipRequestsModel == other.friendshipRequestsModel &&
        searchFriendModel == other.searchFriendModel &&
        allFriendModel == other.allFriendModel;
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
                                $jc(
                                    $jc(
                                        $jc($jc(0, isSuccess.hashCode),
                                            isLoading.hashCode),
                                        isSuccessGetAllFriend.hashCode),
                                    isLoadingGetAllFriend.hashCode),
                                isSuccessSearch.hashCode),
                            isLoadingSearch.hashCode),
                        error.hashCode),
                    selectedPage.hashCode),
                friendshipRequestsModel.hashCode),
            searchFriendModel.hashCode),
        allFriendModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isSuccessGetAllFriend', isSuccessGetAllFriend)
          ..add('isLoadingGetAllFriend', isLoadingGetAllFriend)
          ..add('isSuccessSearch', isSuccessSearch)
          ..add('isLoadingSearch', isLoadingSearch)
          ..add('error', error)
          ..add('selectedPage', selectedPage)
          ..add('friendshipRequestsModel', friendshipRequestsModel)
          ..add('searchFriendModel', searchFriendModel)
          ..add('allFriendModel', allFriendModel))
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

  bool? _isSuccessGetAllFriend;
  bool? get isSuccessGetAllFriend => _$this._isSuccessGetAllFriend;
  set isSuccessGetAllFriend(bool? isSuccessGetAllFriend) =>
      _$this._isSuccessGetAllFriend = isSuccessGetAllFriend;

  bool? _isLoadingGetAllFriend;
  bool? get isLoadingGetAllFriend => _$this._isLoadingGetAllFriend;
  set isLoadingGetAllFriend(bool? isLoadingGetAllFriend) =>
      _$this._isLoadingGetAllFriend = isLoadingGetAllFriend;

  bool? _isSuccessSearch;
  bool? get isSuccessSearch => _$this._isSuccessSearch;
  set isSuccessSearch(bool? isSuccessSearch) =>
      _$this._isSuccessSearch = isSuccessSearch;

  bool? _isLoadingSearch;
  bool? get isLoadingSearch => _$this._isLoadingSearch;
  set isLoadingSearch(bool? isLoadingSearch) =>
      _$this._isLoadingSearch = isLoadingSearch;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  int? _selectedPage;
  int? get selectedPage => _$this._selectedPage;
  set selectedPage(int? selectedPage) => _$this._selectedPage = selectedPage;

  FriendshipRequestsModel? _friendshipRequestsModel;
  FriendshipRequestsModel? get friendshipRequestsModel =>
      _$this._friendshipRequestsModel;
  set friendshipRequestsModel(
          FriendshipRequestsModel? friendshipRequestsModel) =>
      _$this._friendshipRequestsModel = friendshipRequestsModel;

  SearchFriendModel? _searchFriendModel;
  SearchFriendModel? get searchFriendModel => _$this._searchFriendModel;
  set searchFriendModel(SearchFriendModel? searchFriendModel) =>
      _$this._searchFriendModel = searchFriendModel;

  AllFriendModel? _allFriendModel;
  AllFriendModel? get allFriendModel => _$this._allFriendModel;
  set allFriendModel(AllFriendModel? allFriendModel) =>
      _$this._allFriendModel = allFriendModel;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isSuccessGetAllFriend = $v.isSuccessGetAllFriend;
      _isLoadingGetAllFriend = $v.isLoadingGetAllFriend;
      _isSuccessSearch = $v.isSuccessSearch;
      _isLoadingSearch = $v.isLoadingSearch;
      _error = $v.error;
      _selectedPage = $v.selectedPage;
      _friendshipRequestsModel = $v.friendshipRequestsModel;
      _searchFriendModel = $v.searchFriendModel;
      _allFriendModel = $v.allFriendModel;
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
            isSuccessGetAllFriend: isSuccessGetAllFriend,
            isLoadingGetAllFriend: isLoadingGetAllFriend,
            isSuccessSearch: isSuccessSearch,
            isLoadingSearch: isLoadingSearch,
            error: BuiltValueNullFieldError.checkNotNull(
                error, 'HomeState', 'error'),
            selectedPage: BuiltValueNullFieldError.checkNotNull(
                selectedPage, 'HomeState', 'selectedPage'),
            friendshipRequestsModel: BuiltValueNullFieldError.checkNotNull(
                friendshipRequestsModel,
                'HomeState',
                'friendshipRequestsModel'),
            searchFriendModel: BuiltValueNullFieldError.checkNotNull(
                searchFriendModel, 'HomeState', 'searchFriendModel'),
            allFriendModel: BuiltValueNullFieldError.checkNotNull(
                allFriendModel, 'HomeState', 'allFriendModel'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
