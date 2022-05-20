import 'package:flutter/material.dart';
import 'package:sft_project/page/home/home_page.dart';
import 'package:sft_project/page/login/login_page.dart';
import 'package:sft_project/page/package_picking/package_picking_page.dart';
import 'package:sft_project/page/receiced/received_page.dart';
import 'package:sft_project/page/release_pallet/release_pallet_page.dart';
import 'package:sft_project/page/setting/setting_page.dart';
import 'package:sft_project/page/stow/stow_page.dart';
import 'package:sft_project/page/stow_direct/stow_direct_page.dart';
import 'package:sft_project/page/transfer_transport/transfer_transport_page.dart';
import 'package:sft_project/routes/slide_left_route.dart';

class CustomRoutes{
  static Route<dynamic> allRoutes(RouteSettings settings){
    final arg = settings.arguments;
    switch(settings.name){
      case LoginPage.routeName:
        return SlideLeftRoute(LoginPage());
      case HomePage.routeName:
        return SlideLeftRoute(HomePage());
      case SettingPage.routeName:
        return SlideLeftRoute(SettingPage());
      case PackPickPage.routeName:
        return SlideLeftRoute(PackPickPage());
      case ReceivedPage.routeName:
        return SlideLeftRoute(ReceivedPage());
      case ReleasedPalletPage.routeName:
        return SlideLeftRoute(ReleasedPalletPage());
      case StowPage.routeName:
        return SlideLeftRoute(StowPage());
      case StowDirectPage.routeName:
        return SlideLeftRoute(StowDirectPage());
      case TransferTransportPage.routeName:
        return SlideLeftRoute(TransferTransportPage());
      default:
        return null;
    }
  }
}