pool definition
initialize
  "BalloonEngineConstants initialize"

  self initStateConstants.
  self initWorkBufferConstants.
  self initPrimitiveConstants.
  self initEdgeConstants.
  self initFillConstants.
  self initializeInstVarNames: (Smalltalk at: #'BalloonEngine') prefixedBy: 'BE'.
  self
    initializeInstVarNames: (Smalltalk at: #'BalloonEdgeData')
    prefixedBy: 'ET'.
  self
    initializeInstVarNames: (Smalltalk at: #'BalloonFillData')
    prefixedBy: 'FT'