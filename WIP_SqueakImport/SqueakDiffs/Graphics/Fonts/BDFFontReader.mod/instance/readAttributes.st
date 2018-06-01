reading
readAttributes
	| str a |
	"I don't handle double-quotes correctly, but it works"
	file reset.
	[file atEnd] whileFalse: [
		str := self getLine.
		(str beginsWith: 'STARTCHAR') ifTrue: [file skip: (0 - str size - 1). ^self].
		a := str substrings.
		properties at: a first asSymbol put: a allButFirst.
	].
	self error: 'file seems corrupted'.