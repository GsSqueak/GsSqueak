-Etoys-geometry
setIndexInOwner: anInteger 
	"Answer which position the receiver holds in its owner's hierarchy"
	"There is some concern about submorphs that aren't really to be
	counted, such as a background morph of a playfield."
	| _gsSqueakTemp_container _gsSqueakTemp_topRenderer _gsSqueakTemp_indexToUse |
	_gsSqueakTemp_container := (_gsSqueakTemp_topRenderer := self topRendererOrSelf) owner.
	_gsSqueakTemp_indexToUse := (anInteger min: _gsSqueakTemp_container submorphCount)
				max: 1.
	_gsSqueakTemp_container addMorph: _gsSqueakTemp_topRenderer asElementNumber: _gsSqueakTemp_indexToUse