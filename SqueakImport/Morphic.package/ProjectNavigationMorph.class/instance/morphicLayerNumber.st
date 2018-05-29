WiW support
morphicLayerNumber

	"helpful for insuring some morphs always appear in front of or behind others.
	smaller numbers are in front"

	^mouseInside == true ifTrue: [26] ifFalse: [25]

		"Navigators are behind menus and balloons, but in front of most other stuff"