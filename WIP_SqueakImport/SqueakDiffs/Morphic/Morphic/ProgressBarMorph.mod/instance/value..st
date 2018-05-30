accessing
value: aModel
	value ifNotNil: [value removeDependent: self].
	value := aModel.
	value ifNotNil: [value addDependent: self]