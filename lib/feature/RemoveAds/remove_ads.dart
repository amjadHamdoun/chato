import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/color_manager.dart';
const String _kUpgradeId = 'coins_1';
const String _kSilverSubscriptionId = 'coins_1';
const String _kGoldSubscriptionId = '1';
const List<String> _kProductIds = <String>[
  _kUpgradeId,
  _kSilverSubscriptionId,
  _kGoldSubscriptionId,
];
class RemoveAdsScreen extends StatefulWidget {
  const RemoveAdsScreen({Key? key}) : super(key: key);

  @override
  _RemoveAdsScreenState createState() => _RemoveAdsScreenState();
}

class _RemoveAdsScreenState extends State<RemoveAdsScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController pageController = PageController();
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<String> _notFoundIds = <String>[];
  List<ProductDetails> _products = <ProductDetails>[];
  List<PurchaseDetails> _purchases = <PurchaseDetails>[];
  bool _isAvailable = false;
  bool _purchasePending = false;
  bool _loading = true;
  String? _queryProductError;
   Map<String, PurchaseDetails> purchases = {};
   late DateTime dateTime;

   @override
  void initState() {
    purchases =  Map<String, PurchaseDetails>.fromEntries(
        _purchases.map((PurchaseDetails purchase) {
          if (purchase.pendingCompletePurchase) {
            _inAppPurchase.completePurchase(purchase);
          }
          return MapEntry<String, PurchaseDetails>(purchase.productID, purchase);
        }));
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _subscription =
        purchaseUpdated.listen((List<PurchaseDetails>
        purchaseDetailsList) {
          _listenToPurchaseUpdated(purchaseDetailsList);
        }, onDone: () {
          _subscription.cancel();
        }, onError: (Object error) {
          // handle error here.
        });
    initStoreInfo();
    super.initState();
  }

  Future<void> initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    print(isAvailable);
    print('2');
    if (!isAvailable) {
      setState(() {
        _isAvailable = isAvailable;
        _products = <ProductDetails>[];
        _purchases = <PurchaseDetails>[];
        _notFoundIds = <String>[];

        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
      _inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    final ProductDetailsResponse productDetailResponse =
    await _inAppPurchase.queryProductDetails(_kProductIds.toSet());
    if (productDetailResponse.error != null) {
      setState(() {
        _queryProductError = productDetailResponse.error!.message;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = <PurchaseDetails>[];
        _notFoundIds = productDetailResponse.notFoundIDs;

        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      setState(() {
        _queryProductError = null;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = <PurchaseDetails>[];
        _notFoundIds = productDetailResponse.notFoundIDs;

        _purchasePending = false;
        _loading = false;
      });
      return;
    }


    setState(() {
      _isAvailable = isAvailable;
      _products = productDetailResponse.productDetails;
      _notFoundIds = productDetailResponse.notFoundIDs;

      _purchasePending = false;
      _loading = false;
    });
  }

  @override
  void dispose() {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
      _inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    _subscription.cancel();
    super.dispose();
  }


  void showPendingUI() {
    setState(() {
      _purchasePending = true;
    });
  }



  void handleError(IAPError error) {
    setState(() {
      _purchasePending = false;
    });
  }


  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {

    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        showPendingUI();
      }
      else {

        if (purchaseDetails.status == PurchaseStatus.error)
        {
          AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.WARNING,
            body: const Center(child: Text(
              'حدث خطأ ما',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),),

            btnOkText: 'تم',
            btnOkColor: ColorManager.primaryColor,


            btnOkOnPress: () {},

          ).show();
          handleError(purchaseDetails.error!);

        }

         if (purchaseDetails.status == PurchaseStatus.purchased ) {
        //  var box = await Hive.openBox('subBox');
        //  SubModel?  subModel=SubModel(id: '0',
      //        endDate: dateTime,
       //       sub: true);
        //  await box.put('sub', subModel);
      //    Global.subModel=subModel;
          AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.WARNING,
            body: const Center(child: Text(
              'نم شراءه',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),),

            btnOkText: 'تم',
            btnOkColor: ColorManager.primaryColor,


            btnOkOnPress: () {},

          ).show();
        }

        if (purchaseDetails.pendingCompletePurchase) {
          AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.WARNING,
            body: const Center(child: Text(
              'في انتظار اكتمال الشراء',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),),

            btnOkText: 'تم',
            btnOkColor: ColorManager.primaryColor,


            btnOkOnPress: () {},

          ).show();



        }

     if(purchaseDetails.status!=PurchaseStatus.canceled&&
            purchaseDetails.status!=PurchaseStatus.error
        ){

     }
      }
    }
  }

  Future<void> confirmPriceChange(BuildContext context) async {
    if (Platform.isAndroid) {
      final InAppPurchaseAndroidPlatformAddition androidAddition =
      _inAppPurchase
          .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
      final BillingResultWrapper priceChangeConfirmationResult =
      await androidAddition.launchPriceChangeConfirmationFlow(
        sku: 'purchaseId',
      );
      if (priceChangeConfirmationResult.responseCode == BillingResponse.ok) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Price change accepted'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            priceChangeConfirmationResult.debugMessage ??
                'Price change failed with code ${priceChangeConfirmationResult.responseCode}',
          ),
        ));
      }
    }
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iapStoreKitPlatformAddition =
      _inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iapStoreKitPlatformAddition.showPriceConsentIfNeeded();
    }
  }

  GooglePlayPurchaseDetails? _getOldSubscription(
      ProductDetails productDetails, Map<String, PurchaseDetails> purchases) {

    GooglePlayPurchaseDetails? oldSubscription;
    if (productDetails.id == _kSilverSubscriptionId &&
        purchases[_kGoldSubscriptionId] != null) {
      oldSubscription =
      purchases[_kGoldSubscriptionId]! as
      GooglePlayPurchaseDetails;
    } else if (productDetails.id == _kGoldSubscriptionId &&
        purchases[_kSilverSubscriptionId] != null) {
      oldSubscription =
      purchases[_kSilverSubscriptionId]! as
      GooglePlayPurchaseDetails;
    }
    return oldSubscription;
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,

          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: 22.w,
              ),
            ),
            toolbarHeight: 0.07.sh,
            backgroundColor: ColorManager.darkPrimary,
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: SizedBox(
                  width: 0.85.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                    ],
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(

            child: SizedBox(

              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0.25.sh,
                    child: Stack(
                      clipBehavior: Clip.none,
                        children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: ColorManager.darkPrimary,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        height: 0.18.sh,
                      ),
                      Container(
                          decoration: const BoxDecoration(
                              color: ColorManager.primaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          height: 0.15.sh,
                          width: 1.sw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'الاشتراك للحصول على ميزات إضافية ',
                                style: TextStyle(
                                    color: ColorManager.darkPrimary,
                                    fontFamily: 'Qabas',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w300),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                'Subscribe For Additional Features',
                                style: TextStyle(
                                    color: ColorManager.darkPrimary,
                                    fontFamily: 'Qabas',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w300),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          )),
                      Positioned(
                        top: 0.1.sh,
                        right: 0,
                        left: 0,
                        child: SizedBox(
                          height: 100.h,
                          width: 100.w,
                          child:
                          Stack(alignment: Alignment.center,
                              children: [

                          ]),
                        ),
                      ),
                    ]),
                  ),

                  Center(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        for(var prod in _products)
                            Column(
                          children: [
                            InkWell(
                              onTap: ()
                                async {

                                    DateTime date=DateTime.now();
                                    dateTime=
                                        DateTime(date.year , date.month + 1, date.day,date.hour,date.minute);




                                  late PurchaseParam purchaseParam;

                                  if (Platform.isAndroid) {

                                    final GooglePlayPurchaseDetails? oldSubscription =
                                    _getOldSubscription(prod, purchases);

                                    purchaseParam = GooglePlayPurchaseParam(
                                        productDetails: prod,
                                        applicationUserName: null,
                                        changeSubscriptionParam:
                                        (oldSubscription != null)
                                            ? ChangeSubscriptionParam(
                                          oldPurchaseDetails: oldSubscription,
                                          prorationMode: ProrationMode
                                              .immediateWithTimeProration,
                                        )
                                            : null);

                                  } else {
                                    purchaseParam = PurchaseParam(
                                      productDetails: prod,
                                      applicationUserName: null,
                                    );
                                  }
                                  if (Platform.isAndroid) {

                                    await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
                                  } else if (Platform.isIOS) {
                                    await _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
                                  }
                                },
                              child: Container(

                                width: 350.w,
                                decoration: BoxDecoration(
                                    color: ColorManager.darkPrimary,
                                    borderRadius: BorderRadius.circular(59)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                      vertical: 14.h
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        'اشتراك شهري',
                                        style: TextStyle(
                                            fontFamily: 'Qabas',
                                            color: ColorManager.primaryColor,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w300),
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(
                                          prod.price,
                                          style: TextStyle(
                                              fontFamily: 'Qabas',
                                              color: ColorManager.primaryColor,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w300),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.end,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 0.01.sh),
                          ],
                        ),

                        for(var prod in _products)
                            Column(
                              children: [
                                InkWell(
                                  onTap: ()
                                  async {

                                      DateTime date=DateTime.now();
                                      dateTime=
                                          DateTime(date.year+ 1 , date.month , date.day,date.hour,date.minute);



                                    late PurchaseParam purchaseParam;

                                    if (Platform.isAndroid) {

                                      final GooglePlayPurchaseDetails? oldSubscription =
                                      _getOldSubscription(prod, purchases);

                                      purchaseParam = GooglePlayPurchaseParam(
                                          productDetails: prod,
                                          applicationUserName: null,
                                          changeSubscriptionParam:
                                          (oldSubscription != null)
                                              ? ChangeSubscriptionParam(
                                            oldPurchaseDetails: oldSubscription,
                                            prorationMode: ProrationMode
                                                .immediateWithTimeProration,
                                          )
                                              : null);

                                    } else {
                                      purchaseParam = PurchaseParam(
                                        productDetails: prod,
                                        applicationUserName: null,
                                      );
                                    }
                                    if (Platform.isAndroid) {

                                      await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
                                    } else if (Platform.isIOS) {
                                      await _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
                                    }
                                  },
                                  child: Container(

                                    width: 350.w,
                                    decoration: BoxDecoration(
                                        color: ColorManager.darkPrimary,
                                        borderRadius: BorderRadius.circular(59)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 14.h
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            'اشتراك سنوي',
                                            style: TextStyle(
                                                fontFamily: 'Qabas',
                                                color: ColorManager.primaryColor,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w300),
                                            overflow: TextOverflow.visible,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Expanded(
                                            child: Text(
                                              prod.price,
                                              style: TextStyle(
                                                  fontFamily: 'Qabas',
                                                  color: ColorManager.primaryColor,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w300),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.end,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 0.01.sh),
                              ],
                            ),

                        for(var prod in _products)
                            Column(
                              children: [
                                InkWell(
                                  onTap: ()
                                  async {

                                      DateTime date=DateTime.now();
                                      dateTime=
                                          DateTime(date.year+ 100 , date.month ,
                                              date.day,date.hour,date.minute);



                                    late PurchaseParam purchaseParam;

                                    if (Platform.isAndroid) {

                                      final GooglePlayPurchaseDetails? oldSubscription =
                                      _getOldSubscription(prod, purchases);

                                      purchaseParam = GooglePlayPurchaseParam(
                                          productDetails: prod,
                                          applicationUserName: null,
                                          changeSubscriptionParam:
                                          (oldSubscription != null)
                                              ? ChangeSubscriptionParam(
                                            oldPurchaseDetails: oldSubscription,
                                            prorationMode: ProrationMode
                                                .immediateWithTimeProration,
                                          )
                                              : null);

                                    } else {
                                      purchaseParam = PurchaseParam(
                                        productDetails: prod,
                                        applicationUserName: null,
                                      );
                                    }
                                    if (Platform.isAndroid) {

                                      await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
                                    } else if (Platform.isIOS) {
                                      await _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
                                    }
                                  },
                                  child: Container(

                                    width: 350.w,
                                    decoration: BoxDecoration(
                                        color: ColorManager.darkPrimary,
                                        borderRadius: BorderRadius.circular(59)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 14.h
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            'اشتراك دائم',
                                            style: TextStyle(
                                                fontFamily: 'Qabas',
                                                color: ColorManager.primaryColor,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w300),
                                            overflow: TextOverflow.visible,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Expanded(
                                            child: Text(
                                              prod.price,
                                              style: TextStyle(
                                                  fontFamily: 'Qabas',
                                                  color: ColorManager.primaryColor,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w300),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.end,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 0.01.sh),
                              ],
                            ),

                      ]),),

                  SizedBox(height: 0.03.sh),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 15.w) ,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 40.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                  color: ColorManager.darkPrimary,
                                  borderRadius: BorderRadius.circular(59)),
                              child: Center(
                                child: Text(
                                  'ميزات الاشتراك',
                                  style: TextStyle(
                                      fontFamily: 'Qabas',
                                      color: ColorManager.primaryColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          SizedBox(height: 0.01.sh),
                          Row(
                            children:  [
                              const CircleAvatar(
                                  backgroundColor: ColorManager.primaryColor,
                                  radius: 5),
                              SizedBox(width: 0.05.sw,),
                              SizedBox(width: 0.75.sw,
                                child:  Text(
                                  'إزالة الإعلانات بشكل كامل من داخل التطبيق من أجل تصفح أسهل',
                                  style: TextStyle(
                                      fontFamily: 'Qabas',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ),)

                            ],),

                          SizedBox(height: 0.01.sh),
                          Row(
                            children:  [
                              const CircleAvatar(
                                  backgroundColor: ColorManager.primaryColor,
                                  radius: 5),
                              SizedBox(width: 0.05.sw,),
                              SizedBox(width: 0.75.sw,
                                child:  Text(
                                  'إمكانية إضافة عدد غير محدود من العملات في حاسبة العملات',
                                  style: TextStyle(

                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ),)

                            ],),


                        ]),
                  ),

                  SizedBox(height: 0.03.sh),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 15.w) ,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 40.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                  color: ColorManager.darkPrimary,
                                  borderRadius: BorderRadius.circular(59)),
                              child: Center(
                                child: Text(
                                  'حول  الاشتراك',
                                  style: TextStyle(
                                      fontFamily: 'Qabas',
                                      color: ColorManager.primaryColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          SizedBox(height: 0.01.sh),
                          Row(
                            children:  [
                              const CircleAvatar(
                                  backgroundColor: ColorManager.primaryColor,
                                  radius: 5),
                              SizedBox(width: 0.05.sw,),
                              SizedBox(width: 0.8.sw,
                                child:  Text(
                                  'عند الاشتراك هذا يعني أنك موافق على سياسة الخصوصية',
                                  style: TextStyle(
                                      fontFamily: 'Qabas',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ),)

                            ],),
                          SizedBox(height: 0.01.sh),
                          GestureDetector(
                            onTap: (){

                            },
                            child: SizedBox(width: 1.sw,
                              child: Center(child:Text(
                                'اضغط هنا للاطلاع على سياسة الخصوصية وشروط الاستخدام',
                                style: TextStyle(
                                    fontFamily: 'Qabas',
                                    fontSize: 12.sp,
                                    color: ColorManager.primaryColor,
                                    fontWeight: FontWeight.w300),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ), ), ),
                          ),
                          SizedBox(height: 0.01.sh),
                          Row(
                            children:  [
                              const CircleAvatar(
                                  backgroundColor: ColorManager.primaryColor,
                                  radius: 5),
                              SizedBox(width: 0.05.sw,),
                              SizedBox(width: 0.8.sw,
                                child:  Text(
                                  'ستتم عملية الدفع بواسطة حسابك في Google Play',
                                  style: TextStyle(
                                      fontFamily: 'Qabas',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ),)

                            ],),

                          SizedBox(height: 0.01.sh),
                          Row(
                            children:  [
                              const CircleAvatar(
                                  backgroundColor: ColorManager.primaryColor,
                                  radius: 5),
                              SizedBox(width: 0.05.sw,),
                              SizedBox(width: 0.8.sw,
                                child:  Text(
                                  ' يتم تجديد الاشتراك تلقائيا في حال لم يتم الإيقاف قبل 24 ساعة من نهاية الاشتراك السابق',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ),)
                            ],),
                        ]),
                  ),
                  SizedBox(height: 0.1.sh,),
                ],
              ),
            ),
          ),
        ));
  }
}


class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}