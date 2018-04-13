snapshots
startUp
  "DisplayScreen startUp"

  (SessionTemps current at: #'Display')
    setExtent: self actualScreenSize
    depth: (SessionTemps current at: #'Display') nativeDepth.
  (SessionTemps current at: #'Display') beDisplay