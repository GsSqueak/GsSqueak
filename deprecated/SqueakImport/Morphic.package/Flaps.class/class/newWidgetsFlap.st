predefined flaps
newWidgetsFlap
	"Answer a newly-created flap which adheres to the bottom edge of the screen and which holds prototypes of standard widgets. "

	|  aFlapTab aStrip |
	aStrip := PartsBin newPartsBinWithOrientation: #leftToRight andColor: (Color blue muchLighter alpha: 0.8)
		from:	 self quadsDefiningWidgetsFlap.

	aFlapTab := FlapTab new referent: aStrip beSticky.
	aFlapTab setName: 'Widgets' translated edge: #bottom color: Color blue lighter lighter.
	aFlapTab position: ((Display width - (aFlapTab width + 122)) @ (self currentWorld height - aFlapTab height)).
	aFlapTab setBalloonText: aFlapTab balloonTextForFlapsMenu.

	aStrip extent: self currentWorld width @ 78.
	aStrip beFlap: true.
	aStrip autoLineLayout: true.
	
	^ aFlapTab

"Flaps replaceGlobalFlapwithID: 'Widgets' translated "
