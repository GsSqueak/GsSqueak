as yet unclassified
storeTopFormsIn: aStream
  aStream nextPut: car.
  cdr ifNil: [ ^ self ].
  cdr storeTopFormsIn: aStream