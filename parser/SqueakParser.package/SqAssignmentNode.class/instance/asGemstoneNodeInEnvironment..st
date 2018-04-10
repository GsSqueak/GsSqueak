translating
asGemstoneNodeInEnvironment: env
  | gsAssignmentNode |
  self variable isUndeclared
    ifTrue: [ ^ self variable gemstoneNodeAssign: (self value asGemstoneNodeInEnvironment: 0) ].
  gsAssignmentNode := GsComAssignmentNode new.
  gsAssignmentNode
    dest: self variable asGemstoneLeaf
    source: (self value asGemstoneNodeInEnvironment: 0).
  ^ gsAssignmentNode