*BPBugFixes
_baseCategorysForStore: envId
  | dict carr env0Dict |
  (dict := self _baseCategorys: envId)
    ifNil: [ 
      dict := GsMethodDictionary new.
      dict objectSecurityPolicy: self objectSecurityPolicy.
      (envId ~~ 0 and: categorys _isArray not)
        ifTrue: [ 
          env0Dict := categorys.
          categorys := Array new size: 1.
          categorys at: 0 put: env0Dict ].
      (carr := categorys) _isArray
        ifTrue: [ 
          | ofs |
          ofs := envId + 1.
          carr size < ofs
            ifTrue: [ carr size: ofs ].
          carr at: ofs put: dict ]
        ifFalse: [ categorys := dict ] ].
  ^ dict