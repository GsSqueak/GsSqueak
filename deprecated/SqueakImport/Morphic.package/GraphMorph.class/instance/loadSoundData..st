commands
loadSoundData: aCollection

	| newData scale |
	scale := 0.
	aCollection do: [:v |
		| absV |
		(absV := v abs) > scale ifTrue: [scale := absV]].
	scale := 100.0 / scale.
	newData := OrderedCollection new: aCollection size.
	1 to: aCollection size do: [:i | newData addLast: (scale * (aCollection at: i))].

	self data: newData.
	self startIndex: 1.
	self cursor: 1.
