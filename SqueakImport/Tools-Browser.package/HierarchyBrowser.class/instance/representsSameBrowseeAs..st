morphic ui
representsSameBrowseeAs: anotherModel
	^ self hasUnacceptedEdits not
		and: [ classDisplayList size = anotherModel classList size
		and: [ classDisplayList includesAllOf: anotherModel classList ] ]