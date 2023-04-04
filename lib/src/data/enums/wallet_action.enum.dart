enum WalletAction { send, receive, viewDetails }

extension WalletActionX on WalletAction {
  bool get isReceiveCrypto => this == WalletAction.receive;
  bool get isSendCrypto => this == WalletAction.send;
  bool get isViewDetails => this == WalletAction.viewDetails;
}
