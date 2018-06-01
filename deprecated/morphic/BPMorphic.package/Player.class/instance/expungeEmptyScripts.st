scripts-kernel
expungeEmptyScripts
	"Track down and destroy -- and destroy screen artifacts relating to -- all
	scripts belonging to the receiver that have no lines of code in them"
	| _gsSqueakTemp_any |
	_gsSqueakTemp_any := false.
	self class namedTileScriptSelectors
		do: [:aSel | (self isEmptyTileScript: aSel)
				ifTrue: [_gsSqueakTemp_any := true.
					self removeScriptWithoutUpdatingViewers: aSel]].
	_gsSqueakTemp_any
		ifTrue: [self updateAllViewersAndForceToShow: #scripts]