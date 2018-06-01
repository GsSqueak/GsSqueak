WiW support
morphicLayerNumber

	"helpful for insuring some morphs always appear in front of or behind others.
	smaller numbers are in front"

	^self valueOfProperty: #morphicLayerNumber ifAbsent: [12].

	"progress morphs are behind menus and balloons, but in front of most other stuff"