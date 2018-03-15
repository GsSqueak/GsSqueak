contents
sourceStringPrettifiedAndDiffed
	"Answer a copy of the source code for the selected message, transformed by diffing and pretty-printing exigencies"

	| sourceString |
	(self selectedClassName isNil or: [self selectedMessageName isNil]) ifTrue: [^'missing'].
	sourceString := self topazProxy
						sourceCodeFor: self selectedClassName
						selector: self selectedMessageName
						env: self envId.
	"self validateMessageSource: sourceString forSelector: self selectedMessageName inClass: self selectedClassName."
	^sourceString