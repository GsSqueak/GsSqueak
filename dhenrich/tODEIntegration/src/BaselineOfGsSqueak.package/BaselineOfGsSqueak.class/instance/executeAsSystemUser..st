GsSqueak installation
executeAsSystemUser: expression
  | gemNRS sessionDescription systemUser topez |
  topez := TDTopezServer instanceMap at: 1.
  sessionDescription := topez sessionDescription.
  gemNRS := GsNetworkResourceString new
    protocol: 'tcp';
    node: sessionDescription stoneHost;
    netldi: sessionDescription netLDI;
    resource: 'task';
    body: 'gemnetobject';
    yourself.
  systemUser := GsExternalSession new
    stoneNRS: GsNetworkResourceString defaultStoneNRSFromCurrent;
    gemNRS: gemNRS;
    username: 'SystemUser';
    password: 'swordfish';
    yourself.
  [ 
  systemUser login.
  systemUser executeString: expression ]
    ensure: [ systemUser ifNotNil: [ systemUser logout ] ]