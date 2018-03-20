as yet unclassified
getCommonState
  commonState ifNil: [ commonState := RcCounter new ].
  ^ commonState