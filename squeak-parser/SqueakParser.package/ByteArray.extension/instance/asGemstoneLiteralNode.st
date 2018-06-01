*SqueakParser
asGemstoneLiteralNode
  ^ GsComLiteralNode new leaf: (GsComLitLeaf new byteArrayLiteral: self)