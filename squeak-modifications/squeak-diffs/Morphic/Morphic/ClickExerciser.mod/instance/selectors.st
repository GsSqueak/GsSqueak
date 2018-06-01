accessing
selectors
^  self allSelectors with: buttons collect: [ :s :b | b isOn ifTrue: [ s ] ifFalse: [nil ] ] .