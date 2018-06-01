-Etoys-geometry
getIndexInOwner
	"Answer which position the receiver holds in its owner's hierarchy"
	"NB: There is some concern about submorphs that aren't really to be
	counted, such as a background morph of a playfield."
	| _gsSqueakTemp_container _gsSqueakTemp_topRenderer |
	_gsSqueakTemp_container := (_gsSqueakTemp_topRenderer := self topRendererOrSelf) owner.
	^ _gsSqueakTemp_container submorphIndexOf: _gsSqueakTemp_topRenderer