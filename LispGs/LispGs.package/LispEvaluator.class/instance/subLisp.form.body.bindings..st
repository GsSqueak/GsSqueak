private
subLisp: aSymbol form: aForm body: aConsCell bindings: anArray
  | sublisp |
  sublisp := self subLisp: aSymbol form: aForm body: aConsCell.
  (anArray ifNil: [ ^ sublisp ])
    do: [ :assoc | 
      sublisp checkSymbol: assoc key.
      sublisp symbolValuesAdd: assoc ].
  ^ sublisp