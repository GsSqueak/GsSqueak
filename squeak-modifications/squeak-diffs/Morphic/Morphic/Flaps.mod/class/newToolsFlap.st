predefined flaps
newToolsFlap
	"Answer a newly-created flap which adheres to the right edge of the screen and which holds prototypes of standard tools."

	|  aFlapTab aStrip |
	aStrip := PartsBin newPartsBinWithOrientation: #topToBottom andColor: (Color orange muchLighter alpha: 0.8) from: self quadsDefiningToolsFlap.
 
	aFlapTab := FlapTab new referent: aStrip beSticky.
	aFlapTab setName: 'Tools' translated edge: #right color: Color orange lighter.
	aFlapTab position: (self currentWorld width - aFlapTab width) @ ((Display height - aFlapTab height) // 2).
	aFlapTab setBalloonText: aFlapTab balloonTextForFlapsMenu.

	aStrip extent: (90 @ self currentWorld height).
	aStrip beFlap: true.
	
	^ aFlapTab

"Flaps replaceGlobalFlapwithID: 'Tools' translated "
