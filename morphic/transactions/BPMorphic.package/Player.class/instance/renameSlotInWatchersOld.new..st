translation
renameSlotInWatchersOld: oldName new: newName 
	"A variable has been renamed; get all relevant extant watchers
	updated. All this assumed to be happening in the (Smalltalk at: #'ActiveWorld')"
	| _gsSqueakTemp_oldGetter |
	_gsSqueakTemp_oldGetter := oldName asGetterSelector.
	self allPossibleWatchersFromWorld
		do: [:aWatcher | | wasStepping | aWatcher getSelector = _gsSqueakTemp_oldGetter
				ifTrue: [(wasStepping := aWatcher isStepping)
						ifTrue: [aWatcher stopStepping].
					aWatcher getSelector: newName asGetterSelector.
					aWatcher putSelector
						ifNotNil: [aWatcher putSelector: newName asSetterSelector].
					((aWatcher isKindOf: UpdatingStringMorph)
							and: [aWatcher hasStructureOfComplexWatcher])
						ifTrue: ["Old style fancy watcher"
							aWatcher owner owner traverseRowTranslateSlotOld: oldName to: newName.
							(aWatcher target labelFromWatcher: aWatcher)
								contents: newName , ' = '].
					(aWatcher ownerThatIsA: WatcherWrapper)
						ifNotNil: [:wrapper | wrapper player: self variableName: newName].
					wasStepping
						ifTrue: [aWatcher startStepping]]]