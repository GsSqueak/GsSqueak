expression types
statements: argNodes innerBlock: inner
  ^ self
    statements: argNodes
    innerBlock: inner
    blockNode: (SqBlockNode new sourceOffset: hereMark)