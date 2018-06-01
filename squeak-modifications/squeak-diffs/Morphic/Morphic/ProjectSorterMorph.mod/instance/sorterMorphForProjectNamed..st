as yet unclassified
sorterMorphForProjectNamed: projName

	| pvm proj |

	(proj := Project named: projName) ifNil: [^nil].
	pvm := (InternalThreadNavigationMorph getThumbnailFor: proj) asMorph.
	pvm setProperty: #nameOfThisProject toValue: projName.
	pvm isOpaque: true.
	pvm setBalloonText: projName.
	pvm on: #mouseDown send: #clickFromSorterEvent:morph: to: self.
	pvm on: #mouseUp send: #clickFromSorterEvent:morph: to: self.
	^pvm

