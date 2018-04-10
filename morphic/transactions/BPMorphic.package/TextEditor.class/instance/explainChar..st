explain
explainChar: string 
	"Does string start with a special character?"
	| _gsSqueakTemp_char |
	_gsSqueakTemp_char := string at: 1.
	_gsSqueakTemp_char = $.
		ifTrue: [^ '"Period marks the end of a Smalltalk statement.  A period in the middle of a number means a decimal point.  (The number is an instance of class Float)."'].
	_gsSqueakTemp_char = $'
		ifTrue: [^ '"The characters between two single quotes are made into an instance of class String"'].
	_gsSqueakTemp_char = $"
		ifTrue: [^ '"Double quotes enclose a comment.  Smalltalk ignores everything between double quotes."'].
	_gsSqueakTemp_char = $#
		ifTrue: [^ '"The characters following a hash mark are made into an instance of class Symbol.  If parenthesis follow a hash mark, an instance of class Array is made.  It contains literal constants."'].
	(_gsSqueakTemp_char = $(
			or: [_gsSqueakTemp_char = $)])
		ifTrue: [^ '"Expressions enclosed in parenthesis are evaluated first"'].
	(_gsSqueakTemp_char = $[
			or: [_gsSqueakTemp_char = $]])
		ifTrue: [^ '"The code inside square brackets is an unevaluated block of code.  It becomes an instance of BlockContext and is usually passed as an argument."'].
	(_gsSqueakTemp_char = ${
			or: [_gsSqueakTemp_char = $}])
		ifTrue: [^ '"A sequence of expressions separated by periods, when enclosed in curly braces, are evaluated to yield the elements of a new Array"'].
	(_gsSqueakTemp_char = $<
			or: [_gsSqueakTemp_char = $>])
		ifTrue: [^ '"<primitive: xx> means that this method is usually preformed directly by the virtual machine.  If this method is primitive, its Smalltalk code is executed only when the primitive fails."'].
	_gsSqueakTemp_char = $^
		ifTrue: [^ '"Uparrow means return from this method.  The value returned is the expression following the ^"'].
	_gsSqueakTemp_char = $|
		ifTrue: [^ '"Vertical bars enclose the names of the temporary variables used in this method.  In a block, the vertical bar separates the argument names from the rest of the code."'].
	_gsSqueakTemp_char = $_
		ifTrue: [^ '"Left arrow means assignment.  The value of the expression after the left arrow is stored into the variable before it."'].
	_gsSqueakTemp_char = $;
		ifTrue: [^ '"Semicolon means cascading.  The message after the semicolon is sent to the same object which received the message before the semicolon."'].
	_gsSqueakTemp_char = $:
		ifTrue: [^ '"A colon at the end of a keyword means that an argument is expected to follow.  Methods which take more than one argument have selectors with more than one keyword.  (One keyword, ending with a colon, appears before each argument).' , '\\' withCRs , 'A colon before a variable name just inside a block means that the block takes an agrument.  (When the block is evaluated, the argument will be assigned to the variable whose name appears after the colon)."'].
	_gsSqueakTemp_char = $$
		ifTrue: [^ '"The single character following a dollar sign is made into an instance of class Character"'].
	_gsSqueakTemp_char = $-
		ifTrue: [^ '"A minus sign in front of a number means a negative number."'].
	_gsSqueakTemp_char = $e
		ifTrue: [^ '"An e in the middle of a number means that the exponent follows."'].
	_gsSqueakTemp_char = $r
		ifTrue: [^ '"An r in the middle of a bunch of digits is an instance of Integer expressed in a certain radix.  The digits before the r denote the base and the digits after it express a number in that base."'].
	_gsSqueakTemp_char = Character space
		ifTrue: [^ '"the space Character"'].
	_gsSqueakTemp_char = Character tab
		ifTrue: [^ '"the tab Character"'].
	_gsSqueakTemp_char = Character cr
		ifTrue: [^ '"the carriage return Character"'].
	_gsSqueakTemp_char = Character lf
		ifTrue: [^ '"the line feed Character"'].
	^ nil