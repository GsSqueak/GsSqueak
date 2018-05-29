predefined flaps
newSqueakFlap
	"Answer a new default 'Squeak' flap for the left edge of the screen"

	| aFlap aFlapTab aButton aClock buttonColor anOffset bb aFont |
	aFlap := PasteUpMorph newSticky borderWidth: 0.
	aFlapTab := FlapTab new referent: aFlap.
	aFlapTab setName: 'Squeak' translated edge: #left color: Color brown lighter lighter.
	aFlapTab position: (0 @ ((Display height - aFlapTab height) // 2)).
	aFlapTab setBalloonText: aFlapTab balloonTextForFlapsMenu.

	aFlap cellInset: 14@14.
	aFlap beFlap: true.
	aFlap color: (Color brown muchLighter lighter "alpha: 0.3").
	aFlap extent: 150 @ self currentWorld height.
	aFlap layoutPolicy: TableLayout new.
	aFlap wrapCentering: #topLeft.
	aFlap layoutInset: 2.
	aFlap listDirection: #topToBottom.
	aFlap wrapDirection: #leftToRight.

	"self addProjectNavigationButtonsTo: aFlap."
	anOffset := 16.

	aClock := ClockMorph newSticky.
	aClock color: Color red.
	aClock showSeconds: false.
	aClock font: (TextStyle default fontAt: 3).
	aClock step.
	aClock setBalloonText: 'The time of day.  If you prefer to see seconds, check out my menu.' translated.
	aFlap addCenteredAtBottom: aClock offset: anOffset.

	buttonColor :=  Color cyan muchLighter.
	bb := SimpleButtonMorph new target: Smalltalk.
	bb color: buttonColor.
	aButton := bb copy.
	aButton actionSelector: #saveSession.
	aButton setBalloonText: 'Make a complete snapshot of the current state of the image onto disk.' translated.
	aButton label: 'save' translated font: (aFont := ScriptingSystem fontForTiles).
	aFlap addCenteredAtBottom: aButton offset: anOffset.

	aButton := bb copy target: MCMcmUpdater.
	aButton actionSelector: #updateFromServer.
	aButton label: 'load code updates' translated font: aFont.
	aButton color: buttonColor.
	aButton setBalloonText: 'Check the Squeak server for any new code updates, and load any that are found.' translated.
	aFlap addCenteredAtBottom: aButton offset: anOffset.

	aButton := SimpleButtonMorph new target: Smalltalk; actionSelector: #aboutThisSystem;
		label: 'about this system' translated font: aFont.
	aButton color: buttonColor.
	aButton setBalloonText: 'click here to find out version information' translated.
	aFlap addCenteredAtBottom: aButton offset: anOffset.

	aFlap addCenteredAtBottom: (Preferences themeChoiceButtonOfColor: buttonColor font: aFont) offset: anOffset.

	aButton := TrashCanMorph newSticky.
	aFlap addCenteredAtBottom: aButton offset: anOffset.
	aButton startStepping.

	^ aFlapTab

"Flaps replaceGlobalFlapwithID: 'Squeak' translated "