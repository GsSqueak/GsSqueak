arithmetic
* aNumber
	aNumber isFloat ifTrue: [^ self _env0 * aNumber].
	^ aNumber adaptToFloat: self andSend: #*
