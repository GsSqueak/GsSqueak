accessing
environmentAt: key ifAbsentPut: aBlock
  ^ (self actualGsProcess environmentAt: key)
    ifNil: [ self actualGsProcess environmentAt: key put: aBlock ]
