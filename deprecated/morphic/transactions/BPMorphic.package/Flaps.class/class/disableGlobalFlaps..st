menu commands
disableGlobalFlaps: interactive 
	"Clobber all the shared flaps structures. First read the user her Miranda
	rights. "
	interactive
		ifTrue: [(self confirm: 'CAUTION! This will destroy all the shared
flaps, so that they will not be present in 
*any* project.  If, later, you want them
back, you will have to reenable them, from
this same menu, whereupon the standard
default set of shared flaps will be created.
Do you really want to go ahead and clobber
all shared flaps at this time?' translated)
				ifFalse: [^ self]].
	self globalFlapTabsIfAny
		do: [:aFlapTab | 
			self removeFlapTab: aFlapTab keepInList: false.
			aFlapTab isInWorld
				ifTrue: [self error: 'Flap problem' translated]].
	self clobberFlapTabList.
	SharedFlapsAllowed := false.
	Smalltalk isMorphic
		ifTrue: [(Smalltalk at: #ActiveWorld) restoreMorphicDisplay.
			(Smalltalk at: #ActiveWorld) reformulateUpdatingMenus]