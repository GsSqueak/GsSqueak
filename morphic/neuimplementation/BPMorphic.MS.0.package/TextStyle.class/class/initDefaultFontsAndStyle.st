instance creation
initDefaultFontsAndStyle
	"This provides the system with 10 and 12-pt basal fonts.
	Bold and italic versions will be automatically generated as needed"
	| _gsSqueakTemp_fontArray |
	_gsSqueakTemp_fontArray := Array new: 2.
	_gsSqueakTemp_fontArray
		at: 1
		put: (StrikeFont new readFromStrike2: 'NewYork10.sf2').
	_gsSqueakTemp_fontArray
		at: 2
		put: (StrikeFont new readFromStrike2: 'NewYork12.sf2').
	TextConstants
		at: #DefaultTextStyle
		put: (TextStyle fontArray: _gsSqueakTemp_fontArray)