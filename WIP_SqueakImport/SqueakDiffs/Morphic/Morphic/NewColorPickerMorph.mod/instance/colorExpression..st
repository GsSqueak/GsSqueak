accessing
colorExpression: aString 
	"Set my color by evaluating aString, a Smalltalk expression which results in a Color instance."
	| col |
	{aString. 
	'Color ' , aString}
		detect:
			[ : each | ([ col := Compiler evaluate: each ]
				on: Error
				do:
					[ : err | nil ]) notNil ]
		ifNone: [ nil ].
	col ifNotNil: [ self selectedColor: col ]