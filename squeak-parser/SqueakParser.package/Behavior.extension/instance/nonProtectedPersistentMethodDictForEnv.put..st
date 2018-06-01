*SqueakParser
nonProtectedPersistentMethodDictForEnv: envId put: aValue
  "aValue should be a GsMethodDictionary, or nil ,
   caller responsible for _refreshClassCache "

  | ofs mds |
  (mds := methDicts) _isArray
    ifFalse: [ 
      envId == 0
        ifTrue: [ 
          methDicts := aValue.
          ^ self ].
      mds := {mds}.
      methDicts := mds ].
  ofs := envId * 4 + 1.
  mds size < ofs
    ifTrue: [ mds size: ofs ].
  mds at: ofs put: aValue