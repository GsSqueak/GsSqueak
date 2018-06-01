actions & preps
polygon: evt
	| poly |
	poly := self valueOfProperty: #polygon.
	poly ifNil:[^self].
	evt cursorPoint > poly bounds origin ifTrue:[
		poly extent: ((evt cursorPoint - poly bounds origin) max: 5@5)].