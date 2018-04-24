asGemstoneLiteralNode
  | gsArrayNode |
  gsArrayNode := GsComLiteralNode new leaf: self asGemstoneLitLeaf.
  ^ GsComSendNode new
    stSelector: #'beMutable';
    rcvr: gsArrayNode
