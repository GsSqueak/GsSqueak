accessing
type

	^ type ifNil: [self realClass typeOfClass]