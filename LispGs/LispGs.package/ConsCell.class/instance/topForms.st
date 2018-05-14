as yet unclassified
topForms
  cdr ifNil: [ ^ {car} ].
  cdr cdr
    ifNil: [ 
      ^ {car.
      (cdr car)} ].
  cdr cdr cdr
    ifNil: [ 
      ^ {car.
      (cdr car).
      (cdr cdr car)} ].
  ^ Array streamContents: [ :stream | self storeTopFormsIn: stream ]