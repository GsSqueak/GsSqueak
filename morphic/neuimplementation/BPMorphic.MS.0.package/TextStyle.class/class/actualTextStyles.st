TextConstants access
actualTextStyles
	"TextStyle actualTextStyles"
	"Answer dictionary whose keys are the names of styles in the system
	and whose values are the actual styles"
	| _gsSqueakTemp_aDict |
	_gsSqueakTemp_aDict := TextConstants
				select: [:thang | thang isKindOf: self].
	self defaultFamilyNames
		do: [:sym | _gsSqueakTemp_aDict removeKey: sym].
	^ _gsSqueakTemp_aDict