enumeration
childrenDo: aBlock

	firstChild ifNotNil: [
		firstChild withSiblingsDo: aBlock ]