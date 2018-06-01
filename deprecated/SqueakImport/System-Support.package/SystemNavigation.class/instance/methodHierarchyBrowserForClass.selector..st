browse
methodHierarchyBrowserForClass: aClass selector: selectorSymbol
	"Create and schedule a message set browser on all implementors of the 
	currently selected message selector. Do nothing if no message is selected."
	"SystemNavigation default 
		methodHierarchyBrowserForClass: ParagraphEditor 
		selector: #isControlActive"
	| list aClassNonMeta isMeta tab compiledMethod window |
	aClass ifNil: [^ self].
	aClass isTrait ifTrue: [^ self].
	selectorSymbol ifNil: [^ self].
	aClassNonMeta := aClass theNonMetaClass.
	isMeta := aClassNonMeta ~~ aClass.
	list := OrderedCollection new.
	tab := ''.
	aClass allSuperclasses reverseDo:
		[:cl |
		(cl includesSelector: selectorSymbol) ifTrue:
			[list addLast: (MethodReference new
				setClass: cl
				methodSymbol: selectorSymbol
				stringVersion: tab , cl name, ' ', selectorSymbol)].
		tab := tab , '  '].
	aClassNonMeta allSubclassesWithLevelDo:
		[:cl :level | | theClassOrMeta stab |
		theClassOrMeta := isMeta ifTrue: [cl class] ifFalse: [cl].
		(theClassOrMeta includesSelector: selectorSymbol) ifTrue:
			[stab := ''.  1 to: level do: [:i | stab := stab , '  '].
			list addLast: (MethodReference new
				setClass: theClassOrMeta
				methodSymbol: selectorSymbol
				stringVersion: tab , stab , theClassOrMeta name, ' ', selectorSymbol)]]
	 	startingLevel: 0.
	window := self browseMessageList: list name: 'Inheritance of ' , selectorSymbol.
	window isSystemWindow ifTrue: 
		[ window model
			deselectAll ; 
			yourself.
		compiledMethod := aClass compiledMethodAt: selectorSymbol ifAbsent:[nil].
		compiledMethod ifNotNil: [ window model selectReference: compiledMethod methodReference ] ]