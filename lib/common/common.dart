const APP_NAME = 'OVEndField App';

/// DEFINE IMAGE
const PATH_IMAGE = 'lib/resources/assets/';
const PATH_IMAGE_SPLASH = '${PATH_IMAGE}icon.png';
const PATH_IMAGE_COVER_LOGIN_PAGE_DARK_MODE = '${PATH_IMAGE}bg_login_dark.png';
const PATH_IMAGE_COVER_LOGIN_PAGE_LIGHT_MODE = '${PATH_IMAGE}bg_login.png';
const PATH_IMAGE_LOGO_DARK_MODE = '${PATH_IMAGE}ic_logo_Supra_dark.png';
const PATH_IMAGE_LOGO_LIGHT_MODE = '${PATH_IMAGE}ic_logo_Supra.png';
const PATH_IMAGE_COPY_RIGHT = '${PATH_IMAGE}ov_copyright_dark.png';
const PATH_IMAGE_PICK_LIST_PAGE = '${PATH_IMAGE}ic_picklist.png';
const PATH_IMAGE_MAPS_PAGE = '${PATH_IMAGE}ic_sitemap.png';
const PATH_IMAGE_BACKGROUND_WELCOME_APP = '${PATH_IMAGE}bg_welcome_dark.png';
const PATH_ICON_MUTUAL_CHECK = '${PATH_IMAGE}ic_mutual_check.png';
const PATH_ICON_STOCK_GOODS = '${PATH_IMAGE}ic_manage_goods.png';
const PATH_ICON_PACKAGE_PACKING = '${PATH_IMAGE}ic_package_picking.png';
const PATH_ICON_PICKUP_PACKAGED = '${PATH_IMAGE}ic_onetouch.png';
const PATH_ICON_STOW_PACKAGED = '${PATH_IMAGE}ic_stock_goods.png';
const PATH_ICON_SKU = '${PATH_IMAGE}ic_sku.png';
const PATH_ICON_STOW_BIN = '${PATH_IMAGE}ic_stow_bin.png';
const PATH_ICON_PICK_AFTER_PACK = '${PATH_IMAGE}ic_package_picking.png';
const PATH_ICON_STOW_DIRECT = '${PATH_IMAGE}ic_stow_direct.png';
const PATH_ICON_COUNTING_GOODS = '${PATH_IMAGE}ic_counting_goods.png';
const PATH_ICON_RELEASE_PALLET = '${PATH_IMAGE}ic_release_pallet.png';
const PATH_ICON_GATHERING_GOOD = '${PATH_IMAGE}ic_gathering_good.png';
const PATH_ICON_TRANSFER_TRANSPORT_PRODUCT = '${PATH_IMAGE}ic_transfer_transport_product.png';
const PATH_ICON_RECEIVED = '${PATH_IMAGE}ic_received.png';

// Define Language
const VIETNAMESE_LANGUAGE = 'Vietnamese';
const ENGLISH_LANGUAGE = 'English';

// Environment
const DEV_ENVIRONMENT = 'DEV';
const TEST_ENVIRONMENT = 'TEST';
const UAT_ENVIRONMENT = 'UAT';
const PROD_ENVIRONMENT = 'PROD';

// Define Error
const FAIL_CODE = 0;

const SUCCESS_CODE = 1;

const NOTIFY_CODE = 2;

const END_CODE = 3;

// Define Theme
const DARK_THEME = 'DARK';

const LIGHT_THEME = 'LIGHT';

// String Config Environment
const IdentitySTSUrl = 'IdentitySTSUrl';

const OperationServiceUrl = 'OperationServiceUrl';

const AppSecret = 'AppSecret';

const MediaApiUrl = 'MediaApiUrl';

const MediaApiClient = 'MediaApiClient';

const MediaApiEnvironment = 'MediaApiEnvironment';

const DefaultLanguageCode = 'DefaultLanguageCode';

const OVEnfieldServiceUrl = 'OVEnfieldServiceUrl';

const OVGateWayServiceUrl = 'OVGateWayServiceUrl';

const BotTelegramToken = 'BotTelegramToken';

const BotTelegramChatId = 'BotTelegramChatId';

const OVWFTServiceUrl = 'OVWFTServiceUrl';

const WFTStowServiceUrl = 'WFTStowServiceUrl';

// IdentityConfig
const CLIENT_ID_IDENTITY_CONFIG = 'masanmobileservice';

const SCOPE_IDENTITY_CONFIG =
    'openid profile masaninfo masanopswebapp masanadminservice idmgr masanopsservice offline_access';

const GRANT_TYPE_IDENTITY_CONFIG = 'password';

// OV Auth Config
// const CLIENT_ID_OV_AUTH_CONFIG = 'wms_ops_service';
const CLIENT_ID_OV_AUTH_CONFIG = 'sftclient';

const CLIENT_SECRET_OV_AUTH_CONFIG = 'KvCBX8t#&iGW#9tj';

const GRANT_TYPE_OV_AUTH_CONFIG = 'password';

// Request API
const CONNECT_TIMEOUT = 10000;

const RECEIVE_TIMEOUT = 8000;

// Define Status
const STATUS_NEW = 'new';

const STATUS_PROCESSING = 'processing';

const STATUS_SUCCESS = 'success';

// Define layout Maps
const TYPE_UI_BIN = 'bin';

const TYPE_UI_BIN_CAR = 'bincar';

const TYPE_UI_PATH = 'path';

const TYPE_UI_NODE_EMPTY = 'nodeempty';

const TYPE_UI_BIN_VALUE = 'Bin';

const TYPE_UI_BIN_FM_VALUE = 'BinFM';

const TYPE_UI_BIN_CAR_VALUE = 'BinCar';

const TYPE_UI_BIN_FM = 'binfm';

const TYPE_UI_BIN_DUMMY_FM = 'bindummyfm';

const TYPE_UI_BIN_DUMMY = 'bindummy';

const TYPE_UI_EMPTY = 'empty';

const TYPE_UI_STAIRS = 'stairs';

const TYPE_UI_WALL = 'wall';

const TYPE_UI_DOOR = 'door';

const STATUS_PICK_NORMAL = 'normal';

const STATUS_PICK_PICKED = 'picked';

const STATUS_PICK_NOT_YET = 'notyet';

// Const name module
const Get_List_SO = 'Get_List_SO';

const View_All_Maps = 'View_All_Maps';

const View_Map_Picking = 'View_Map_Picking';

const View_Partial_Map_Picking = 'View_Partial_Map_Picking';

const View_SO_Pool = 'View_SO_Pool';

const Pick_List_SO_Pool = 'Pick_List_SO_Pool';

const Pick_List = 'Pick_List';

const Mutual_Check = 'Mutual_Check';

const Stock_Goods = 'Stock_Goods';

const Get_Packages = 'Get_Packages';

const Detail_Sku_Pick_List = 'Detail_Sku_Pick_List';

const ModuleView_All_Maps = '${View_All_Maps}_$View_All_Maps';

const ModuleViewMapPicking = '${View_Map_Picking}_$View_Map_Picking';

const ModuleView_Pick_List = '${Pick_List}_$Pick_List';

const SVG_HEADER_TOP =
    '''<?xml version="1.0" encoding="UTF-8" standalone="no"?>''';

const SVG_HEADER_BOTTOM = '''
<g>
    <g transform="translate(0 0)">''';

const SVG_FOOTER = '''</g>
 </g>
</svg>''';

const SVG_EXAMPLE = '''<?xml version="1.0" encoding="UTF-8"?>
<svg viewBox="0 0 20 10" xmlns="http://www.w3.org/2000/svg">
  <!--
  The circle will always intercept the mouse event.
  To change the color of the rect underneath you have
  to click outside the circle
  -->
  <rect x="0" y="0" height="10" width="10" fill="black" />
  <circle cx="5" cy="5" r="4" fill="white"
          pointer-events="visiblePoint" />

  <!--
  The circle below will never catch a mouse event.
  The rect underneath will change color whether you
  are clicking on the circle or the rect itself
  -->
  <rect x="10" y="0" height="10" width="10" fill="black" />
  <circle id="circle1" r="4" cx="15" cy="5" onclick="circle1.style.fill='yellow';"
            style="fill: red; stroke: blue; stroke-width: 0.5"/>
</svg>
''';
