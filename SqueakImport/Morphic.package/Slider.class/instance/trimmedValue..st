support
trimmedValue: aValue

	| trimmedValue |
	trimmedValue := aValue min: self maximumValue max: self minimumValue.
	self quantum ifNotNil: [:q | trimmedValue := trimmedValue roundTo: q].
	^ trimmedValue
