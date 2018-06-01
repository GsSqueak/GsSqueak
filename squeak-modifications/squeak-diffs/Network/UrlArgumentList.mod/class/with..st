instance creation
with: argAssoc
	| argList |
	argList := self new.
	argList add: argAssoc key value: argAssoc value.
	^argList