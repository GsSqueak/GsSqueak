initialization
optionalButtonRow
	"Answer the button row associated with a file list"

	| aRow |
	aRow := AlignmentMorph newRow beSticky.
	aRow color: Color transparent.
	aRow clipSubmorphs: true.
	aRow layoutInset: 5@1; cellInset: 6.
	self universalButtonServices do:  "just the three sort-by items"
			[:service |
				aRow addMorphBack: (service buttonToTriggerIn: self).
				(service selector  == #sortBySize)
					ifTrue:
						[aRow addTransparentSpacerOfSize: (4@0)]].
	aRow setNameTo: 'buttons'.
	aRow setProperty: #buttonRow toValue: true.  "Used for dynamic retrieval later on"
	^ aRow