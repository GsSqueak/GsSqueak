ui requests
chooseClassOrTrait: label from: environment 
	"Let the user choose a Class or Trait."
	| _gsSqueakTemp_pattern |
	_gsSqueakTemp_pattern := self request: label.
	^ self
		classOrTraitFrom: environment
		pattern: _gsSqueakTemp_pattern
		label: label