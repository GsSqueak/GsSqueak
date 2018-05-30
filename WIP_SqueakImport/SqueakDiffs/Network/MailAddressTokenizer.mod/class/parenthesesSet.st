class initialization
parenthesesSet

	^CSParens ifNil: [ CSParens:= CharacterSet newFrom: '()' ]