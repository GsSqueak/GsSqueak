slot-kedama
createSlotForPatch: aPatchMorph 
	"anEmbeddedMorph has just been added to my costume because of
	explicit user action. 
	Create an instance variable and accessors for it as a Player-valued slot."
	| _gsSqueakTemp_itsName _gsSqueakTemp_openViewers |
	self costume isInWorld
		ifFalse: [^ self].
	_gsSqueakTemp_itsName := aPatchMorph externalName asSymbol.
	self slotInfo
		at: _gsSqueakTemp_itsName
		put: (SlotInformation new initialize type: #Patch).
	self addInstanceVarNamed: _gsSqueakTemp_itsName withValue: aPatchMorph assuredPlayer.
	self class compileAccessorsFor: _gsSqueakTemp_itsName.
	_gsSqueakTemp_openViewers := self allOpenViewersOnReceiverAndSiblings.
	_gsSqueakTemp_openViewers isEmpty
		ifTrue: [^ self]
		ifFalse: [| aPresenter |
			(aPresenter := self costume presenter)
				ifNil: [^ self].
			_gsSqueakTemp_openViewers
				do: [:aViewer | aPresenter updateViewer: aViewer forceToShow: ScriptingSystem nameForInstanceVariablesCategory]]