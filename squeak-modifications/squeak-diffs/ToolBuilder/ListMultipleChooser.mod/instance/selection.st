accessing
selection

	^ selection ifNil: [selection := Array new: self values size withAll: false]