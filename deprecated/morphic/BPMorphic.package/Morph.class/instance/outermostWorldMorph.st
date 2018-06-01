structure
outermostWorldMorph
  | outer |
  (Smalltalk at: #'World') ifNotNil: [ ^ Smalltalk at: #'World' ].
  self flag: #'arNote'.	"stuff below is really only for MVC"
  outer := self outermostMorphThat: [ :x | x isWorldMorph ].
  outer ifNotNil: [ ^ outer ].
  self isWorldMorph
    ifTrue: [ ^ self ].
  ^ nil