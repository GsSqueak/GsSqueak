initialize-release
initialiseModule
  <export: true>
  self initBBOpTable.
  self initDither8Lookup.
  self
    isDefined: #'ENABLE_FAST_BLT'
    inSmalltalk: [ false ]
    comment: 'init the fastpath lists'
    ifTrue: [ self initialiseCopyBits ].
  ^ true