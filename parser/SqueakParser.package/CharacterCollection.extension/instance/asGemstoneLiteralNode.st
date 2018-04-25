*SqueakParser
asGemstoneLiteralNode
  ^ GsComSendNode new
    stSelector: #'copy';
    rcvr: (GsComLiteralNode newString: self);
    yourself
