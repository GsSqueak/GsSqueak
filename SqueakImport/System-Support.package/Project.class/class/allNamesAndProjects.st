utilities
allNamesAndProjects

	^(self allProjects
		sorted: [ :p1 :p2 | p1 name caseInsensitiveLessOrEqual: p2 name ])
		replace: [ :aProject | Array with: aProject name with: aProject ]