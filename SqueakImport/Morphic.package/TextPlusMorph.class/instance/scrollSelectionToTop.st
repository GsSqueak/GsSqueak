as yet unclassified
scrollSelectionToTop

	(self parentGeeMail ifNil: [^self])
		scrollSelectionIntoView: nil 
		alignTop: true 
		inTextMorph: self.
