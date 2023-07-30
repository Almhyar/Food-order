import 'dart:convert';
import 'package:food/core/data/models/cart_model.dart';
import 'package:get/get.dart';
import 'package:food/core/data/models/apis/token_info.dart';
import 'package:food/core/enums/data_type.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepository {
  SharedPreferences globalSharedPrefs = Get.find();
  String PREF_FIRST_LANUCH = 'first_lanuch';
  String PREF_IS_LOGGEDIN = 'login';
  String PREF_TOKEN_INFO = 'token_info';
  String PREF_APP_LANG = 'app_language';
  String PREF_CART_LIST = 'cart_list';
  String PREF_ORDER_PLACED = 'order_placed';
  String PREF_SUB_STATUS = 'sub_status';
  setSubStatus(bool value) {
    setPreferance(
      dataType: DataType.BOOL,
      key: PREF_SUB_STATUS,
      value: value,
    );
  }

  bool getSubStatus() {
    if (globalSharedPrefs.containsKey(PREF_SUB_STATUS)) {
      return getPrefrance(key: PREF_SUB_STATUS);
    } else {
      return true;
    }
  }

  setTokenInfo(TokenInfo value) {
    setPreferance(
      dataType: DataType.STRING,
      key: PREF_TOKEN_INFO,
      value: jsonEncode(value),
    );
  }

  TokenInfo? getTokenInfo() {
    if (globalSharedPrefs.containsKey(PREF_TOKEN_INFO)) {
      return TokenInfo.fromJson(jsonDecode(getPrefrance(key: PREF_TOKEN_INFO)));
    } else {
      return null;
    }
  }

  setIsLoggedIN(bool value) {
    setPreferance(
      dataType: DataType.BOOL,
      key: PREF_IS_LOGGEDIN,
      value: value,
    );
  }

  bool getIsLoggedIn() {
    if (globalSharedPrefs.containsKey(PREF_IS_LOGGEDIN))
      return getPrefrance(key: PREF_IS_LOGGEDIN);
    else
      return false;
  }

  setFirstLanuch(bool value) {
    setPreferance(
      dataType: DataType.BOOL,
      key: PREF_FIRST_LANUCH,
      value: value,
    );
  }

  bool getFirstLanuch() {
    if (globalSharedPrefs.containsKey(PREF_FIRST_LANUCH))
      return getPrefrance(key: PREF_FIRST_LANUCH);
    else
      return true;
  }

  setAppLanguage(String value) {
    setPreferance(
      dataType: DataType.STRING,
      key: PREF_APP_LANG,
      value: value,
    );
  }

  String getAppLanguage() {
    if (globalSharedPrefs.containsKey(PREF_APP_LANG)) {
      return getPrefrance(key: PREF_APP_LANG);
    } else {
      return 'ar';
    }
  }

  void setCartList(List<CartModel> list) {
    setPreferance(
        dataType: DataType.STRING,
        key: PREF_CART_LIST,
        value: CartModel.encode(list));
  }

  List<CartModel> getCartList() {
    if (globalSharedPrefs.containsKey(PREF_CART_LIST)) {
      return CartModel.decode(getPrefrance(key: PREF_CART_LIST));
    } else {
      return [];
    }
  }

  setOrderPlaced(bool value) {
    setPreferance(
      dataType: DataType.BOOL,
      key: PREF_ORDER_PLACED,
      value: value,
    );
  }

  bool getOrderPlaced() {
    if (globalSharedPrefs.containsKey(PREF_ORDER_PLACED)) {
      return getPrefrance(key: PREF_ORDER_PLACED);
    } else {
      return false;
    }
  }

  setPreferance({
    required DataType dataType,
    required String key,
    required dynamic value,
  }) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPrefs.setInt(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPrefs.setBool(key, value);
        break;
      case DataType.STRING:
        await globalSharedPrefs.setString(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPrefs.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await globalSharedPrefs.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrance({required String key}) {
    return globalSharedPrefs.get(key);
  }
}
