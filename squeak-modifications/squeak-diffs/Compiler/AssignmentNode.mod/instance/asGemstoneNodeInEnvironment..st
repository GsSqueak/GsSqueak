translating
asGemstoneNodeInEnvironment: env
  | gsAssignmentNode |
  gsAssignmentNode := (GemstoneSmalltalk _env0 at: #GsComAssignmentNode) _env0 new.
  gsAssignmentNode _env0
    dest: self variable asGemstoneLeaf
    source: (self value asGemstoneNodeInEnvironment: env).
  ^ gsAssignmentNode
