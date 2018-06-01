e-toy support
currentPlayerDo: aBlock
	| aPlayer aPage |
	(aPage := self currentPage) ifNil: [^ self].
	aPage allMorphsDo:[ :m|
	(aPlayer := m player) ifNotNil:
		[aBlock value: aPlayer]]