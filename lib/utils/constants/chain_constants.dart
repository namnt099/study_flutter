import 'app_constants.dart';

class Chains {
  const Chains._();
  static const String BTC = 'BTC';
  static const String ETH = 'ETH';
  static const String TRON = 'TRON';

  static const String ETH_NETWORK = 'ETHEREUM';
  static const String TRON_NETWORK = 'TRON';
  static const String BTC_NETWORK = 'BITCOIN';
  static const String NEAR_NETWORK = 'NEAR';
  static const String POLYGON_NETWORK = 'POLYGON';
  static const String SMART_NETWORK = 'BINANCE';
}

String getNetworkId(String type) {
  switch (type.toUpperCase()) {
    case Chains.ETH_NETWORK:
      return AppConstants.ethChainId;
    case Chains.TRON_NETWORK:
      return AppConstants.tronChainId;
    case Chains.BTC_NETWORK:
      return AppConstants.btcChainId;
    case Chains.NEAR_NETWORK:
      return AppConstants.nearChainId;
    case Chains.POLYGON_NETWORK:
      return AppConstants.polygonChainId;
    case Chains.SMART_NETWORK:
      return AppConstants.bscChainId;
    default:
    return '';
  }
}
