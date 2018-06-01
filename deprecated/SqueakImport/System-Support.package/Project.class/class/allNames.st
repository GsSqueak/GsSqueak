utilities
allNames

	^(self allProjects collect: [:p | p name]) sort: [:n1 :n2 | n1 caseInsensitiveLessOrEqual: n2]