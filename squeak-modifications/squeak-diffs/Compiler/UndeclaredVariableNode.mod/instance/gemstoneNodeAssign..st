translating
gemstoneNodeAssign: aGsCompilerIRNode
    | gsNode |
    gsNode := self asGemstoneNodeInEnvironment: 0.
    gsNode _env0 appendArgument: aGsCompilerIRNode.
    gsNode _env0 stSelector: #'at:put:'.
    ^ gsNode
