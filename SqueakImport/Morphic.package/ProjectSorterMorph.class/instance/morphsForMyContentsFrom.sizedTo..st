as yet unclassified
morphsForMyContentsFrom: listOfPages sizedTo: sz

	| morphsForPageSorter |

	'Assembling thumbnail images...'
		displayProgressFrom: 0 to: listOfPages size
		during: [:bar |
			morphsForPageSorter := listOfPages withIndexCollect: [ :each :index | 
				bar value: index.
				self sorterMorphForProjectNamed: each first
			].
		].
	^morphsForPageSorter
