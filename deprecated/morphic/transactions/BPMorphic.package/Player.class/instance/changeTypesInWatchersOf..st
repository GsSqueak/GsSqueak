translation
changeTypesInWatchersOf: slotName 
	"The type of a variable has changed; adjust watchers to that fact."
	| _gsSqueakTemp_aGetter |
	_gsSqueakTemp_aGetter := slotName asGetterSelector.
	self allPossibleWatchersFromWorld
		do: [:aWatcher | | newWatcher | aWatcher getSelector = _gsSqueakTemp_aGetter
				ifTrue: [(aWatcher ownerThatIsA: WatcherWrapper)
						ifNotNil: [:aWrapper | 
							newWatcher := aWrapper submorphs size = 1
										ifTrue: [WatcherWrapper new unlabeledForPlayer: self getter: _gsSqueakTemp_aGetter]
										ifFalse: [WatcherWrapper new fancyForPlayer: self getter: _gsSqueakTemp_aGetter].
							newWatcher position: aWatcher position.
							aWrapper owner replaceSubmorph: aWrapper by: newWatcher]]]