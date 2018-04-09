translating
gemstoneNodeAssign: aGsCompilerIRNode
  ^ (self asGemstoneNodeInEnvironment: 0)
    appendArgument: aGsCompilerIRNode;
    stSelector: #'at:put:'