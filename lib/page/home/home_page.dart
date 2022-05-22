import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sft_project/model/module_name.dart';
import 'package:sft_project/page/gathering_good/gathering_good_page.dart';
import 'package:sft_project/page/package_picking/package_picking_page.dart';
import 'package:sft_project/page/receiced/received_page.dart';
import 'package:sft_project/page/release_pallet/release_pallet_page.dart';
import 'package:sft_project/page/stow/stow_page.dart';
import 'package:sft_project/page/stow_direct/stow_direct_page.dart';
import 'package:sft_project/page/transfer_transport/transfer_transport_page.dart';
import 'package:sft_project/util/app_color.dart';
import 'package:sft_project/util/screen_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  Size? size;

  List<ModuleName> _listModule = [
    ModuleName(
        id: '1', name: 'LƯU KHO', imagePath: 'assets/img/ic_stow_direct.png'),
    ModuleName(
        id: '2', name: 'ĐỊNH VỊ', imagePath: 'assets/img/ic_stow_bin.png'),
    ModuleName(
        id: '3',
        name: 'LUÂN CHUYỂN HÀNG HÓA',
        imagePath: 'assets/img/ic_transfer_transport_product.png'),
    ModuleName(
        id: '4',
        name: 'THAY ĐỔI ĐỊNH VỊ',
        imagePath: 'assets/img/ic_release_pallet.png'),
    ModuleName(
        id: '5', name: 'NHẬN HÀNG', imagePath: 'assets/img/ic_received.png'),
    ModuleName(
        id: '6',
        name: 'LẤY HÀNG SAU ĐÓNG GÓI',
        imagePath: 'assets/img/ic_package_picking.png'),
    ModuleName(
        id: '7',
        name: 'TẬP KẾT',
        imagePath: 'assets/img/ic_gathering_good_bk.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorBackgroundContainerDark,
      appBar: AppBar(
        title: Text('Trang chủ'),
        backgroundColor: AppColor.colorBackgroundDrak,
        centerTitle: true,
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Container(
      padding: EdgeInsets.all(ScreenUtil.getInstance().getAdapterSize(6)),
      child: Column(
        children: [Expanded(child: _gridModuleWidget())],
      ),
    );
  }

  Widget _gridModuleWidget() {
    size = MediaQuery.of(context).size;
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: (size!.width / 2) / (size!.width / 1.85),
      ),
      itemCount: _listModule.length,
      itemBuilder: (context, index) {
        return _moduleWidget(_listModule[index]);
      },
    );
  }

  Widget _moduleWidget(ModuleName moduleName) {
    return GestureDetector(
      onTap: () => _tapModuleNav(moduleName.id!),
      child: Card(
        color: AppColor.colorBackgroundDrak,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                height: 100,
                image: AssetImage(moduleName.imagePath!),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Center(
                  child: Text(
                    moduleName.name!.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _tapModuleNav(String indexModule) {
    switch (indexModule) {
      case '1':
        Navigator.pushNamed(context, StowDirectPage.routeName);
        break;
      case '2':
        Navigator.pushNamed(context, StowPage.routeName);
        break;
      case '3':
        Navigator.pushNamed(context, TransferTransportPage.routeName);
        break;
      case '4':
        Navigator.pushNamed(context, ReleasedPalletPage.routeName);
        break;
      case '5':
        Navigator.pushNamed(context, ReceivedPage.routeName);
        break;
      case '6':
        Navigator.pushNamed(context, PackPickPage.routeName);
        break;
      case '7':
        Navigator.pushNamed(context, GatheringGood.routeName);
        break;
    }
  }
}
