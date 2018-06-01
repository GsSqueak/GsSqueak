context stack (message list)
selectedMessage
	"Answer the source code of the currently selected context."
	| aContext |
	^contents := (aContext := self selectedContext) debuggerMap sourceText asText makeSelectorBoldIn: aContext home receiver class