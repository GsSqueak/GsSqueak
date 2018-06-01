predefined flaps
newStackToolsFlap
	"Add a flap with stack tools in it"

	| aFlapTab aStrip |
	aStrip := PartsBin newPartsBinWithOrientation: #leftToRight
		andColor: (Color red muchLighter "alpha: 0.2") from: self quadsDefiningStackToolsFlap.

	aFlapTab := FlapTab new referent: aStrip beSticky.
	aFlapTab setName: 'Stack Tools' translated edge: #bottom color: Color brown lighter lighter.
	aFlapTab position: ((Display width - (aFlapTab width + 226)) @ (self currentWorld height - aFlapTab height)).
	aFlapTab setBalloonText: aFlapTab balloonTextForFlapsMenu.

	aStrip extent: self currentWorld width @ 78.
	aStrip beFlap: true.
	aStrip autoLineLayout: true.
	aStrip extent: self currentWorld width @ 70.

	^ aFlapTab

"Flaps replaceGlobalFlapwithID: 'Stack Tools' translated"