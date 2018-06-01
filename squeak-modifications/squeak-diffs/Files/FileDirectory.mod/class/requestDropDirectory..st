dnd requests
requestDropDirectory: dropIndex

	| potentialDirectory | 
	potentialDirectory := self on: (FileStream primDropRequestFileName: dropIndex).
	^ potentialDirectory exists ifTrue: [potentialDirectory]
