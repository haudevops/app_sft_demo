// Get Config App
import 'package:global_configuration/global_configuration.dart';

import 'common.dart';

GlobalConfiguration config = GlobalConfiguration();
final String indentityUrlGetToken = config.getValue(IdentitySTSUrl);
final String operatorServiceUrl = config.getValue(OperationServiceUrl);
final String baseUrlCommonApi = config.getValue(OperationServiceUrl);
final String secretIdentityConfig = config.getValue(AppSecret);
final String ovEnfieldServiceUrl = config.getValue(OVEnfieldServiceUrl);
final String ovMediaApiEnvironment = config.getValue(MediaApiEnvironment);
final String ovGateWayServiceUrl = config.getValue(OVGateWayServiceUrl);
final String botTelegramToken = config.getValue(BotTelegramToken);
final String botTelegramChatId = config.getValue(BotTelegramChatId);
final String stowWFTServiceUrl = config.getValue(WFTStowServiceUrl);

// Define API
const API_GET_TOKEN_URN = 'auth/token';
const API_GET_USER_INFO_URN = 'auth/authenticate';
const API_CHANGE_PASSWORD_URN = 'api/v0.1/Employee/ChangePassword';
const API_VIEW_TRANSPORT_BY_CODE_URN = 'api/v0.1/Transport/ViewTransportByCode';
const API_LOGOUT_URN = 'auth/expire';

// Check Version
const API_CHECK_VERSION_APP_URN = 'check/version/';

// Define API
const API_GET_MAP_URN = '/maps/';
const API_GET_PARTIAL_MAP_URN = '/devidezone/';
const API_GET_REGION_MAP_URN = '/getRegion/';
const API_GET_LEVEL_MAP_URN = '/getLevel/';
const API_GET_PICK_LIST_NEW_PACKAGE_URN = '/picking/list/';
const API_SCAN_PICK_LIST_NEW_PACKAGE_URN = '/scanPickingListNew/';
const API_UPDATE_TOTE_PICK_LIST_PACKAGE_URN = '/updateTotePickingListNew/';
const API_GET_DETAIL_PICKING_PACKAGE_URN = '/getDetailPickingListNew/';
const API_END_PICKING_LIST_PACKAGE_URN = '/endPickingListNew/';
const API_GET_MDL_PICK_LIST = '/endPickingListNew/';

// Transfer product
const API_GET_TRANSFER_PRODUCT_PACKAGE_URN = '/getPickingListNewForStoring/';
const API_GET_LIST_STORE_EQUIPMENT_PACKAGE_URN = '/getListStoreEquipmentForStoring/';
const API_GET_DETAIL_TRANSFER_PRODUCT_PACKAGE_URN = '/getDetailPickingListNewForStoring/';
const API_UPDATE_STORAGE_TRANSFER_PRODUCT_PACKAGE_URN = '/storePickingListNew/';
const API_END_TRANSFER_PRODUCT_PACKAGE_URN = '/endStorePickingListNew/';
const API_UPDATE_STORAGE_EQUIPMENT_TO_PICK_LIST_PACKAGE_URN = '/updateStorageEquipmentToPickList/';

const API_END_PICKED_URN = '/endPickingList/';
const API_GET_ALL_PACKAGE_URN = '/getPickingList/';
const API_UPDATE_PICKING_LIST_URN = '/updatePickingList/';
