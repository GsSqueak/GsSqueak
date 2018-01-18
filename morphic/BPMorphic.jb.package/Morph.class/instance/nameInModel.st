naming
nameInModel	"Return the name for this morph in the underlying model or nil."	| w |	w := self world.	w isNil		ifTrue: [^ nil]		ifFalse: [^ w model nameFor: self]