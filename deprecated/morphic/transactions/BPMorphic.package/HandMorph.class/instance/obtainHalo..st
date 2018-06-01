halo handling
obtainHalo: aHalo 
	"Used for transfering halos between hands"
	| _gsSqueakTemp_formerOwner |
	self halo == aHalo
		ifTrue: [^ self].
	"Find former owner"
	_gsSqueakTemp_formerOwner := self world hands
				detect: [:h | h halo == aHalo]
				ifNone: [].
	_gsSqueakTemp_formerOwner
		ifNotNil: [_gsSqueakTemp_formerOwner releaseHalo: aHalo].
	self halo: aHalo