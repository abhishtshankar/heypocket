import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : LoginWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          requireAuth: true,
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: 'CreateItem',
          path: '/createItem',
          requireAuth: true,
          builder: (context, params) => CreateItemWidget(),
        ),
        FFRoute(
          name: 'AddCustomer',
          path: '/addCustomer',
          requireAuth: true,
          builder: (context, params) => AddCustomerWidget(),
        ),
        FFRoute(
          name: 'CustomerList',
          path: '/customerList',
          requireAuth: true,
          builder: (context, params) => CustomerListWidget(),
        ),
        FFRoute(
          name: 'EstimateList',
          path: '/estimateList',
          requireAuth: true,
          builder: (context, params) => EstimateListWidget(),
        ),
        FFRoute(
          name: 'CreateProject',
          path: '/createProject',
          requireAuth: true,
          builder: (context, params) => CreateProjectWidget(),
        ),
        FFRoute(
          name: 'ProjectMainPage',
          path: '/projectMainPage',
          requireAuth: true,
          builder: (context, params) => ProjectMainPageWidget(),
        ),
        FFRoute(
          name: 'CreateExpense',
          path: '/createExpense',
          requireAuth: true,
          builder: (context, params) => CreateExpenseWidget(),
        ),
        FFRoute(
          name: 'AllExpenses',
          path: '/allExpenses',
          requireAuth: true,
          builder: (context, params) => AllExpensesWidget(),
        ),
        FFRoute(
          name: 'AllItems',
          path: '/allItems',
          requireAuth: true,
          builder: (context, params) => AllItemsWidget(),
        ),
        FFRoute(
          name: 'Categories',
          path: '/categories',
          requireAuth: true,
          builder: (context, params) => CategoriesWidget(),
        ),
        FFRoute(
          name: 'ProjectTransaction',
          path: '/projectTransaction',
          requireAuth: true,
          builder: (context, params) => ProjectTransactionWidget(
            projectTransaction: params.getParam(
                'projectTransaction',
                ParamType.DocumentReference,
                false,
                ['users', 'ExpenseVsIncome']),
            projectRefNav: params.getParam('projectRefNav',
                ParamType.DocumentReference, false, ['users', 'Project']),
          ),
        ),
        FFRoute(
          name: 'MaterialLibarary',
          path: '/materialLibarary',
          requireAuth: true,
          builder: (context, params) => MaterialLibararyWidget(
            projects: params.getParam('projects', ParamType.DocumentReference,
                false, ['users', 'Project']),
            transactions: params.getParam(
                'transactions',
                ParamType.DocumentReference,
                false,
                ['users', 'ExpenseVsIncome']),
          ),
        ),
        FFRoute(
          name: 'MaterialValue',
          path: '/materialValue',
          requireAuth: true,
          builder: (context, params) => MaterialValueWidget(
            materialvalue: params.getParam('materialvalue',
                ParamType.DocumentReference, false, ['MaterialLibrary']),
          ),
        ),
        FFRoute(
          name: 'PDFDoc',
          path: '/pDFDoc',
          requireAuth: true,
          builder: (context, params) => PDFDocWidget(
            estimateNum: params.getParam('estimateNum', ParamType.String),
            customerName: params.getParam('customerName', ParamType.String),
            paymentStatus: params.getParam('paymentStatus', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'EditProfile',
          path: '/editProfile',
          requireAuth: true,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: 'ProfileMenu',
          path: '/profileMenu',
          requireAuth: true,
          builder: (context, params) => ProfileMenuWidget(),
        ),
        FFRoute(
          name: 'CustomerProfile',
          path: '/customerProfile',
          requireAuth: true,
          builder: (context, params) => CustomerProfileWidget(
            customerProfilepage: params.getParam(
                'customerProfilepage',
                ParamType.DocumentReference,
                false,
                ['users', 'CustomersVendors']),
          ),
        ),
        FFRoute(
          name: 'InvoiceList',
          path: '/invoiceList',
          requireAuth: true,
          builder: (context, params) => InvoiceListWidget(),
        ),
        FFRoute(
          name: 'CreateInvoice',
          path: '/createInvoice',
          requireAuth: true,
          builder: (context, params) => CreateInvoiceWidget(),
        ),
        FFRoute(
          name: 'EditCustomer',
          path: '/editCustomer',
          requireAuth: true,
          builder: (context, params) => EditCustomerWidget(
            editProfile: params.getParam(
                'editProfile',
                ParamType.DocumentReference,
                false,
                ['users', 'CustomersVendors']),
          ),
        ),
        FFRoute(
          name: 'AddVendor',
          path: '/addVendor',
          requireAuth: true,
          builder: (context, params) => AddVendorWidget(),
        ),
        FFRoute(
          name: 'VendorList',
          path: '/vendorList',
          requireAuth: true,
          builder: (context, params) => VendorListWidget(),
        ),
        FFRoute(
          name: 'VendorProfile',
          path: '/vendorProfile',
          requireAuth: true,
          builder: (context, params) => VendorProfileWidget(
            vendorpage: params.getParam(
                'vendorpage',
                ParamType.DocumentReference,
                false,
                ['users', 'CustomersVendors']),
          ),
        ),
        FFRoute(
          name: 'EditVendor',
          path: '/editVendor',
          requireAuth: true,
          builder: (context, params) => EditVendorWidget(
            editProfile: params.getParam(
                'editProfile',
                ParamType.DocumentReference,
                false,
                ['users', 'CustomersVendors']),
          ),
        ),
        FFRoute(
          name: 'CreateTask',
          path: '/createTask',
          requireAuth: true,
          builder: (context, params) => CreateTaskWidget(),
        ),
        FFRoute(
          name: 'CreatePO',
          path: '/createPO',
          requireAuth: true,
          builder: (context, params) => CreatePOWidget(),
        ),
        FFRoute(
          name: 'POlist',
          path: '/pOlist',
          requireAuth: true,
          builder: (context, params) => POlistWidget(),
        ),
        FFRoute(
          name: 'UpdateStaff',
          path: '/updateStaff',
          requireAuth: true,
          builder: (context, params) => UpdateStaffWidget(),
        ),
        FFRoute(
          name: 'StaffProfile',
          path: '/staffProfile',
          requireAuth: true,
          builder: (context, params) => StaffProfileWidget(
            staffprofile: params.getParam(
                'staffprofile', ParamType.DocumentReference, false, ['Staff']),
          ),
        ),
        FFRoute(
          name: 'StaffList',
          path: '/staffList',
          requireAuth: true,
          builder: (context, params) => StaffListWidget(),
        ),
        FFRoute(
          name: 'EditExpense',
          path: '/editExpense',
          requireAuth: true,
          builder: (context, params) => EditExpenseWidget(),
        ),
        FFRoute(
          name: 'TaskPage',
          path: '/taskPage',
          requireAuth: true,
          builder: (context, params) => TaskPageWidget(),
        ),
        FFRoute(
          name: 'ProjectAttendance1',
          path: '/projectAttendance1',
          requireAuth: true,
          builder: (context, params) => ProjectAttendance1Widget(
            staffattendance: params.getParam('staffattendance',
                ParamType.DocumentReference, false, ['Attendance']),
          ),
        ),
        FFRoute(
          name: 'TaskListD',
          path: '/taskListD',
          requireAuth: true,
          builder: (context, params) => TaskListDWidget(),
        ),
        FFRoute(
          name: 'CreateEstimate',
          path: '/createEstimate',
          requireAuth: true,
          builder: (context, params) => CreateEstimateWidget(),
        ),
        FFRoute(
          name: 'InvoiceItems',
          path: '/invoiceItems',
          requireAuth: true,
          builder: (context, params) => InvoiceItemsWidget(),
        ),
        FFRoute(
          name: 'AddStaff',
          path: '/addStaff',
          requireAuth: true,
          asyncParams: {
            'staffList': getDocList(['Staff'], StaffRecord.fromSnapshot),
          },
          builder: (context, params) => AddStaffWidget(
            staffList: params.getParam<StaffRecord>(
                'staffList', ParamType.Document, true),
          ),
        ),
        FFRoute(
          name: 'PaymentIn',
          path: '/paymentIn',
          requireAuth: true,
          builder: (context, params) => PaymentInWidget(
            transaction: params.getParam(
                'transaction',
                ParamType.DocumentReference,
                false,
                ['users', 'ExpenseVsIncome']),
            projectref: params.getParam('projectref',
                ParamType.DocumentReference, false, ['users', 'Project']),
          ),
        ),
        FFRoute(
          name: 'COnfirmedInvoicePageCopy',
          path: '/cOnfirmedInvoicePageCopy',
          requireAuth: true,
          builder: (context, params) => COnfirmedInvoicePageCopyWidget(),
        ),
        FFRoute(
          name: 'ProjectPage1',
          path: '/projectPage1',
          requireAuth: true,
          builder: (context, params) => ProjectPage1Widget(
            projectTransaction: params.getParam(
                'projectTransaction',
                ParamType.DocumentReference,
                false,
                ['users', 'ExpenseVsIncome']),
            projectRefNav: params.getParam('projectRefNav',
                ParamType.DocumentReference, false, ['users', 'Project']),
          ),
        ),
        FFRoute(
          name: 'PaymentOut',
          path: '/paymentOut',
          requireAuth: true,
          builder: (context, params) => PaymentOutWidget(
            transaction: params.getParam(
                'transaction',
                ParamType.DocumentReference,
                false,
                ['users', 'ExpenseVsIncome']),
            projectref: params.getParam('projectref',
                ParamType.DocumentReference, false, ['users', 'Project']),
          ),
        ),
        FFRoute(
          name: 'TaskListDummy',
          path: '/TaskListDummy',
          builder: (context, params) => TaskListDummyWidget(),
        ),
        FFRoute(
          name: 'alltasks',
          path: '/alltasks',
          requireAuth: true,
          builder: (context, params) => AlltasksWidget(
            projectRefNav: params.getParam('projectRefNav',
                ParamType.DocumentReference, false, ['users', 'Project']),
          ),
        ),
        FFRoute(
          name: 'updateproject',
          path: '/updateproject',
          requireAuth: true,
          builder: (context, params) => UpdateprojectWidget(
            project: params.getParam('project', ParamType.DocumentReference,
                false, ['users', 'Project']),
          ),
        ),
        FFRoute(
          name: 'customeListDummy',
          path: '/customeListDummy',
          requireAuth: true,
          builder: (context, params) => CustomeListDummyWidget(),
        ),
        FFRoute(
          name: 'pagedateattenance',
          path: '/pagedateattenance',
          requireAuth: true,
          builder: (context, params) => PagedateattenanceWidget(
            projectattendance: params.getParam('projectattendance',
                ParamType.DocumentReference, false, ['users', 'Project']),
          ),
        ),
        FFRoute(
          name: 'attendance',
          path: '/attendance',
          requireAuth: true,
          builder: (context, params) => AttendanceWidget(
            attendance: params.getParam('attendance',
                ParamType.DocumentReference, false, ['users', 'attednacenew']),
            projects: params.getParam('projects', ParamType.DocumentReference,
                false, ['users', 'Project']),
          ),
        ),
        FFRoute(
          name: 'attendancelist',
          path: '/attendancelist',
          requireAuth: true,
          builder: (context, params) => AttendancelistWidget(
            project: params.getParam('project', ParamType.DocumentReference,
                false, ['users', 'Project']),
            transaction: params.getParam(
                'transaction',
                ParamType.DocumentReference,
                false,
                ['users', 'ExpenseVsIncome']),
          ),
        ),
        FFRoute(
          name: 'adduser',
          path: '/adduser',
          requireAuth: true,
          builder: (context, params) => AdduserWidget(),
        ),
        FFRoute(
          name: 'ChatLIst',
          path: '/chatLIst',
          requireAuth: true,
          builder: (context, params) => ChatLIstWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitDualRing(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}