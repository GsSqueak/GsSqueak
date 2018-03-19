translating
asGemstoneNodeInEnvironment: env
  | gsAssignmentNode |
  gsAssignmentNode := GsComAssignmentNode new.
  gsAssignmentNode
    dest: self variable asGemstoneLeaf
    source: (self value asGemstoneNodeInEnvironment: 0).
  ^ gsAssignmentNode