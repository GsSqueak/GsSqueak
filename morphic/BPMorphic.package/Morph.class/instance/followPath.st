-Etoys-support
followPath
	| _gsSqueakTemp_pathPoints _gsSqueakTemp_offset |
	(_gsSqueakTemp_pathPoints := self renderedMorph valueOfProperty: #pathPoints)
		ifNil: [^ Beeper beep].
	_gsSqueakTemp_offset := owner position - (self extent // 2).
	_gsSqueakTemp_pathPoints
		do: [:aPoint | 
			self position: aPoint + _gsSqueakTemp_offset.
			self world displayWorld.
			(Delay forMilliseconds: 20) wait]