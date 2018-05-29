known threads
openThreadNamed: nameOfThread atIndex: anInteger

	| coll nav |

	coll := self knownThreads at: nameOfThread ifAbsent: [^self].
	nav := Project current world 
		submorphThat: [ :each | (each isKindOf: self) and: [each threadName = nameOfThread]]
		ifNone: [
			nav := self basicNew.
			nav
				listOfPages: coll;
				threadName: nameOfThread index: anInteger;
				initialize;
				openInWorld;
				positionAppropriately.
			^self
		].
	nav
		listOfPages: coll;
		threadName: nameOfThread index: anInteger;
		removeAllMorphs;
		addButtons.

