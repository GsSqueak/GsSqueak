parts bin
exampleBackgroundLabel
	"Answer a background label for a parts bin"
	| _gsSqueakTemp_aTextMorph |
	_gsSqueakTemp_aTextMorph := self authoringPrototype.
	_gsSqueakTemp_aTextMorph contents: 'background
label' asText.
	_gsSqueakTemp_aTextMorph
		beAllFont: (StrikeFont familyName: #NewYork size: 18).
	_gsSqueakTemp_aTextMorph color: Color brown.
	_gsSqueakTemp_aTextMorph setProperty: #shared toValue: true.
	^ _gsSqueakTemp_aTextMorph