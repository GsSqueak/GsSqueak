*gssqueak-gemstone-tools
persistentSuperclassForEnv: envId
  "result will be nil if no methods exist for specified environmentId."

  | mds |
  (mds := methDicts) _isArray
    ifTrue: [ ^ mds atOrNil: envId * 4 + 3 ].
  envId == 0
    ifTrue: [ ^ mds ].
  ^ nil
