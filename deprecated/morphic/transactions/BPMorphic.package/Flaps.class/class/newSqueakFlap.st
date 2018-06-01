predefined flaps
newSqueakFlap
	"Answer a new default 'Squeak' flap for the left edge of the screen"
	| _gsSqueakTemp_aFlap _gsSqueakTemp_aFlapTab _gsSqueakTemp_aButton _gsSqueakTemp_aClock _gsSqueakTemp_buttonColor _gsSqueakTemp_anOffset _gsSqueakTemp_bb _gsSqueakTemp_aFont |
	_gsSqueakTemp_aFlap := PasteUpMorph newSticky borderWidth: 0.
	_gsSqueakTemp_aFlapTab := FlapTab new referent: _gsSqueakTemp_aFlap.
	_gsSqueakTemp_aFlapTab
		setName: 'Squeak' translated
		edge: #left
		color: Color brown lighter lighter.
	_gsSqueakTemp_aFlapTab position: 0 @ (Display height - _gsSqueakTemp_aFlapTab height // 2).
	_gsSqueakTemp_aFlapTab setBalloonText: _gsSqueakTemp_aFlapTab balloonTextForFlapsMenu.
	_gsSqueakTemp_aFlap cellInset: 14 @ 14.
	_gsSqueakTemp_aFlap beFlap: true.
	_gsSqueakTemp_aFlap color: Color brown muchLighter lighter.
	"alpha: 0.3"
	_gsSqueakTemp_aFlap extent: 150 @ self currentWorld height.
	_gsSqueakTemp_aFlap layoutPolicy: TableLayout new.
	_gsSqueakTemp_aFlap wrapCentering: #topLeft.
	_gsSqueakTemp_aFlap layoutInset: 2.
	_gsSqueakTemp_aFlap listDirection: #topToBottom.
	_gsSqueakTemp_aFlap wrapDirection: #leftToRight.
	"self addProjectNavigationButtonsTo: aFlap."
	_gsSqueakTemp_anOffset := 16.
	_gsSqueakTemp_aClock := ClockMorph newSticky.
	_gsSqueakTemp_aClock color: Color red.
	_gsSqueakTemp_aClock showSeconds: false.
	_gsSqueakTemp_aClock
		font: (TextStyle default fontAt: 3).
	_gsSqueakTemp_aClock step.
	_gsSqueakTemp_aClock setBalloonText: 'The time of day.  If you prefer to see seconds, check out my menu.' translated.
	_gsSqueakTemp_aFlap addCenteredAtBottom: _gsSqueakTemp_aClock offset: _gsSqueakTemp_anOffset.
	_gsSqueakTemp_buttonColor := Color cyan muchLighter.
	_gsSqueakTemp_bb := SimpleButtonMorph new target: Smalltalk.
	_gsSqueakTemp_bb color: _gsSqueakTemp_buttonColor.
	_gsSqueakTemp_aButton := _gsSqueakTemp_bb copy.
	_gsSqueakTemp_aButton actionSelector: #saveSession.
	_gsSqueakTemp_aButton setBalloonText: 'Make a complete snapshot of the current state of the image onto disk.' translated.
	_gsSqueakTemp_aButton label: 'save' translated font: (_gsSqueakTemp_aFont := ScriptingSystem fontForTiles).
	_gsSqueakTemp_aFlap addCenteredAtBottom: _gsSqueakTemp_aButton offset: _gsSqueakTemp_anOffset.
	_gsSqueakTemp_aButton := _gsSqueakTemp_bb copy target: MCMcmUpdater.
	_gsSqueakTemp_aButton actionSelector: #updateFromServer.
	_gsSqueakTemp_aButton label: 'load code updates' translated font: _gsSqueakTemp_aFont.
	_gsSqueakTemp_aButton color: _gsSqueakTemp_buttonColor.
	_gsSqueakTemp_aButton setBalloonText: 'Check the Squeak server for any new code updates, and load any that are found.' translated.
	_gsSqueakTemp_aFlap addCenteredAtBottom: _gsSqueakTemp_aButton offset: _gsSqueakTemp_anOffset.
	_gsSqueakTemp_aButton := SimpleButtonMorph new target: Smalltalk;
				 actionSelector: #aboutThisSystem;
				 label: 'about this system' translated font: _gsSqueakTemp_aFont.
	_gsSqueakTemp_aButton color: _gsSqueakTemp_buttonColor.
	_gsSqueakTemp_aButton setBalloonText: 'click here to find out version information' translated.
	_gsSqueakTemp_aFlap addCenteredAtBottom: _gsSqueakTemp_aButton offset: _gsSqueakTemp_anOffset.
	_gsSqueakTemp_aFlap
		addCenteredAtBottom: (Preferences themeChoiceButtonOfColor: _gsSqueakTemp_buttonColor font: _gsSqueakTemp_aFont)
		offset: _gsSqueakTemp_anOffset.
	_gsSqueakTemp_aButton := TrashCanMorph newSticky.
	_gsSqueakTemp_aFlap addCenteredAtBottom: _gsSqueakTemp_aButton offset: _gsSqueakTemp_anOffset.
	_gsSqueakTemp_aButton startStepping.
	^ _gsSqueakTemp_aFlapTab"Flaps replaceGlobalFlapwithID: 'Squeak' translated"