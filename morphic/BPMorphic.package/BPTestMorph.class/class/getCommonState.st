as yet unclassified
getCommonState
  commonState ifNil: [ commonState := RcRecentInteger new ].
  ^ commonState