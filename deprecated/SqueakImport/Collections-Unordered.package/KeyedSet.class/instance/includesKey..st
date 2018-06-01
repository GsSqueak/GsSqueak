testing
includesKey: key

	(array at: (self scanFor: key)) ifNil: [ ^false ] ifNotNil: [ ^true ]