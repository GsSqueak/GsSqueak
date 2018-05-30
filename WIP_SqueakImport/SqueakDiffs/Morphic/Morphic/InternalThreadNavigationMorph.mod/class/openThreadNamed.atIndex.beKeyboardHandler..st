known threads
openThreadNamed: nameOfThread atIndex: anInteger beKeyboardHandler: aBoolean
	"Activate the thread of the given name, from the given index; set it up to be navigated via desktop keys if indicated"

	| coll nav |

	coll := self knownThreads at: nameOfThread ifAbsent: [^self].
	nav := Project current world 
		submorphThat: [ :each | (each isKindOf: self) and: [each threadName = nameOfThread]]
		ifNone:
			[nav := self basicNew.
			nav
				listOfPages: coll;
				threadName: nameOfThread index: anInteger;
				initialize;
				openInWorld;
				positionAppropriately.
			aBoolean ifTrue: [ActiveWorld keyboardNavigationHandler: nav].
			^ self].
	nav
		listOfPages: coll;
		threadName: nameOfThread index: anInteger;
		removeAllMorphs;
		addButtons.
	aBoolean ifTrue: [ActiveWorld keyboardNavigationHandler: nav]

