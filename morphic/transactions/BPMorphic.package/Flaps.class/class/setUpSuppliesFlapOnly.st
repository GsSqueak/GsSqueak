menu support
setUpSuppliesFlapOnly
	"Set up the Supplies flap as the only shared flap. A special version
	formulated for this stand-alone use is used, defined in
	#newLoneSuppliesFlap "
	| _gsSqueakTemp_supplies |
	SharedFlapTabs isEmptyOrNil
		ifFalse: ["get rid of pre-existing guys if any"
			SharedFlapTabs
				do: [:t | 
					t referent delete.
					t delete]].
	SharedFlapsAllowed := true.
	SharedFlapTabs := OrderedCollection new.
	SharedFlapTabs add: (_gsSqueakTemp_supplies := self newLoneSuppliesFlap).
	self enableGlobalFlapWithID: 'Supplies' translated.
	_gsSqueakTemp_supplies setToPopOutOnMouseOver: false.
	Smalltalk isMorphic
		ifTrue: [(Smalltalk at: #ActiveWorld) addGlobalFlaps.
			(Smalltalk at: #ActiveWorld) reformulateUpdatingMenus]