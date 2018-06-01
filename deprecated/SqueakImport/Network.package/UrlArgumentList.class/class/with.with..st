instance creation
with: firstArgAssoc with: secondArgAssoc
	| argList |
	argList := self with: firstArgAssoc.
	argList add: secondArgAssoc key value: secondArgAssoc value.
	^argList