predefined flaps
newNavigatorFlap
	"Answer a newly-created flap which adheres to the bottom edge of the screen and which holds the project navigator controls. "

	|  aFlapTab navBar aFlap |
	navBar := ProjectNavigationMorph preferredNavigator new addButtons.
	aFlap := PasteUpMorph newSticky borderWidth: 0;
			extent: navBar extent + (0@20);
			color: (Color orange alpha: 0.8);
			beFlap: true;
			addMorph: navBar beSticky.
	aFlap hResizing: #shrinkWrap; vResizing: #shrinkWrap.
	aFlap useRoundedCorners.
	aFlap setNameTo: 'Navigator Flap' translated.
	navBar fullBounds.  "to establish width"
	
	aFlapTab := FlapTab new referent: aFlap.
	aFlapTab setName: 'Navigator' translated edge: #bottom color: Color orange.
	aFlapTab position: ((navBar width // 2) - (aFlapTab width // 2))
					@ (self currentWorld height - aFlapTab height).
	aFlapTab setBalloonText: aFlapTab balloonTextForFlapsMenu.
	^ aFlapTab

"Flaps replaceGlobalFlapwithID: 'Navigator' translated "
