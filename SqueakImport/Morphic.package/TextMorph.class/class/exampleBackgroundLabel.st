parts bin
exampleBackgroundLabel
	"Answer a background label for a parts bin"

	| aTextMorph |
	aTextMorph := self authoringPrototype.
	aTextMorph contents: 'background
label' asText.  
	aTextMorph beAllFont: (StrikeFont familyName: #NewYork size: 18).
	aTextMorph color: Color brown.
	aTextMorph setProperty: #shared toValue: true.
	^ aTextMorph
