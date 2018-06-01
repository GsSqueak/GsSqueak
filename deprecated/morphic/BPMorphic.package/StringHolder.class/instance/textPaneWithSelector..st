-Tools
textPaneWithSelector: aSelector 
	"If, among my window's paneMorphs, there is a text pane defined with
	aSelector as its retriever, answer it, else answer nil"
	Smalltalk isMorphic
		ifFalse: [^ nil].
	^ self containingWindow
		ifNotNil: [:_gsSqueakTemp_aWindow | _gsSqueakTemp_aWindow
				paneMorphSatisfying: [:aMorph | (aMorph isKindOf: PluggableTextMorph)
						and: [aMorph getTextSelector == aSelector]]]