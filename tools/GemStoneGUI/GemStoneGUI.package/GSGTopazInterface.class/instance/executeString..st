interface
executeString: sourceString
	
	| output |
	output := self run: sourceString.
	output second ifNotEmpty: [:errorOutput | self error: errorOutput].
	^ output first