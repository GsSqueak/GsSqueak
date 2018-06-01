predefined flaps
newObjectsFlap
	"Answer a fully-instantiated flap named 'Objects' to be placed at the top of the screen."

	|  aFlapTab anObjectsTool |
	anObjectsTool := ObjectsTool new.
	anObjectsTool initializeForFlap.

	aFlapTab := FlapTab new referent: anObjectsTool beSticky.
	aFlapTab setName: 'Objects' translated edge: #top color: Color red lighter.
	aFlapTab position: ((Display width - (aFlapTab width + 22)) @ 0).
	aFlapTab setBalloonText: aFlapTab balloonTextForFlapsMenu.

	anObjectsTool extent: self currentWorld width @ 200.
	anObjectsTool beFlap: true.
	anObjectsTool color: Color red muchLighter.
	anObjectsTool clipSubmorphs: true.

	anObjectsTool showCategories.

	^ aFlapTab