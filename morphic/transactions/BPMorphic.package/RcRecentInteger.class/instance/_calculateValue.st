as yet unclassified
_calculateValue
  | value latest sessionElement systm |
  value := 0.
  latest := 0.
  systm := System.
  systm _addEntireObjectToRcReadSet: self.
  1 to: self size do: [ :i | 
    sessionElement := self at: i.
    sessionElement ~~ nil
      ifTrue: [ 
        latest < (self at: i) timestamp
          ifTrue: [ 
            value := sessionElement value.
            latest := sessionElement timestamp ].
        systm _addRootObjectToRcReadSet: sessionElement ] ].
  systm rcValueCacheAt: #'value' put: value for: self.
  ^ value