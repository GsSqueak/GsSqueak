as yet unclassified
textPlusMenuFor: aMorph

	| menu |
	menu := MenuMorph new.
	menu 
		add: 'Link to text selection' 
		target: [self addAlansAnchorFor: aMorph]
		selector: #value;

		add: 'Unlink from text selection' 
		target: [self removeAlansAnchorFor: aMorph]
		selector: #value;

		add: 'Delete' 
		target: [
			self removeAlansAnchorFor: aMorph.
			aMorph delete.
		]
		selector: #value.
	^menu
