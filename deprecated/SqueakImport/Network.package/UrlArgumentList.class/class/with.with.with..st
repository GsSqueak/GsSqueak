instance creation
with: firstArgAssoc with: secondArgAssoc with: thirdArgAssoc
	| argList |
	argList := self with: firstArgAssoc with: secondArgAssoc.
	argList add: thirdArgAssoc key value: thirdArgAssoc value.
	^argList