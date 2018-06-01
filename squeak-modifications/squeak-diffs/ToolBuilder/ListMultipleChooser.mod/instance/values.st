accessing
values

	^ values ifNil: [values := (1 to: self labels size) asArray]