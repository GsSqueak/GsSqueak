structure
containingWindow
	"Answer a window that contains the receiver. Try to use the model to find the right window. If I do not have a model, use the model of one of my owners. We could also just use #isSystemWindow. This, however, gives system windows the chance to refrain from taking ownership of this morph."

	| component |
	component := self.
	component model isNil ifTrue: [component := self firstOwnerSuchThat: [:m| m model notNil]].
	^(component isNil or: [component isWindowForModel: component model])
		ifTrue: [component]
		ifFalse: [component firstOwnerSuchThat:[:m| m isWindowForModel: component model]]