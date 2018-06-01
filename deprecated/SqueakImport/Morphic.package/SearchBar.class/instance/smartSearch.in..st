searching
smartSearch: text in: morph
	"Take the user input and perform an appropriate search"
	| input newContents |
	self removeResultsWidget.
	input := text asString ifEmpty:[^self].
	self class useSmartSearch ifFalse: [^ ToolSet default browseMessageNames: input].

	"If it is a global or a full class name, browse that class."
	(Smalltalk bindingOf: input) ifNotNil:[:assoc| | global |
		global := assoc value.
		^ToolSet browse: (global isBehavior ifTrue:[global] ifFalse:[global class]) selector: nil].
	
	"If it is a symbol and there are implementors of it, browse those implementors."
	(Symbol lookup: input) ifNotNil: [:selector |
		(SystemNavigation new allImplementorsOf: selector) ifNotEmpty:[:list|
			^SystemNavigation new
				browseMessageList: list
				name: 'Implementors of ' , input]].

	"If it starts uppercase, browse classes if any. Otherwise, just search for messages."
	input first isUppercase
		ifTrue: [
			(UIManager default classFromPattern: input withCaption: '')
				ifNotNil:[:aClass| ^ToolSet browse: aClass selector: nil]
				ifNil: [
					newContents := input, ' -- not found.'.
					self searchTerm: newContents.
					self selection: (input size+1 to: newContents size).
					self currentHand newKeyboardFocus: morph textMorph.
					^ self]]
		ifFalse: [
			ToolSet default browseMessageNames: input].