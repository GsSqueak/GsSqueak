as yet unclassified
getCommonState
  commonState ifNil: [ commonState := BPTestMorphState new ].
  ^ commonState