e-toy support
currentPlayerDo: aBlock 
	| _gsSqueakTemp_aPage |
	(_gsSqueakTemp_aPage := self currentPage)
		ifNil: [^ self].
	_gsSqueakTemp_aPage
		allMorphsDo: [:m | m player
				ifNotNil: [:_gsSqueakTemp_aPlayer | aBlock value: _gsSqueakTemp_aPlayer]]