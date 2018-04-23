*SqueakParser
asGemstoneLiteralNode
  ^ GsComSendNode new
    stSelector: #'withAll:';
    appendArgument: (GsComLiteralNode newString: self);
    rcvr: (GsComVariableNode globalNamed: #'String' inDict: Smalltalk);
    yourself