*LispGs
printOn: aStream forLisp: aLisp
  aStream nextPutAll: '#<'.
  self printOn: aStream.
  aStream nextPut: $>