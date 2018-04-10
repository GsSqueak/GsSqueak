-Etoys-scripting
asEmptyPermanentScriptor
	"Answer a new empty permanent scriptor derived from info deftly
	secreted in the receiver. Good grief"
	| _gsSqueakTemp_aScriptor _gsSqueakTemp_aPlayer |
	_gsSqueakTemp_aPlayer := self valueOfProperty: #newPermanentPlayer.
	_gsSqueakTemp_aPlayer assureUniClass.
	_gsSqueakTemp_aScriptor := _gsSqueakTemp_aPlayer newScriptorAround: nil.
	_gsSqueakTemp_aScriptor position: self world primaryHand position - (10 @ 10).
	_gsSqueakTemp_aPlayer updateAllViewersAndForceToShow: #scripts.
	^ _gsSqueakTemp_aScriptor