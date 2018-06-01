as yet unclassified
update: aMenuMorph
	"Reconstitute the menu by first removing the contents and then building it afresh"

	aMenuMorph removeAllMorphs.
	arguments 
		ifNil: [ updater perform: updateSelector with: aMenuMorph ]
		ifNotNil: [ 
			updater 
				perform: updateSelector 
				withArguments: (arguments copyWith: aMenuMorph) ].
	aMenuMorph changed