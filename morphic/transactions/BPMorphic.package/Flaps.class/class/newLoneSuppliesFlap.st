predefined flaps
newLoneSuppliesFlap
	"Answer a fully-instantiated flap named 'Supplies' to be placed at the
	bottom of the screen, for use when it is the only flap shown upon web
	launch "
	"Flaps setUpSuppliesFlapOnly"
	| _gsSqueakTemp_aFlapTab _gsSqueakTemp_aStrip _gsSqueakTemp_leftEdge |
	_gsSqueakTemp_aStrip := PartsBin
				newPartsBinWithOrientation: #leftToRight
				andColor: Color red muchLighter
				from: #(#(#TrashCanMorph #new 'Trash' 'A tool for discarding objects' ) #(#ScriptingSystem #scriptControlButtons 'Status' 'Buttons to run, stop, or single-step scripts' ) #(#AllScriptsTool #allScriptsToolForActiveWorld 'All Scripts' 'A tool that lets you control all the running scripts in your world' ) #(#PaintInvokingMorph #new 'Paint' 'Drop this into an area to start making a fresh painting there' ) #(#RectangleMorph #authoringPrototype 'Rectangle' 'A rectangle' ) #(#RectangleMorph #roundRectPrototype 'RoundRect' 'A rectangle with rounded corners' ) #(#EllipseMorph #authoringPrototype 'Ellipse' 'An ellipse or circle' ) #(#StarMorph #authoringPrototype 'Star' 'A star' ) #(#CurveMorph #authoringPrototype 'Curve' 'A curve' ) #(#PolygonMorph #authoringPrototype 'Polygon' 'A straight-sided figure with any number of sides' ) #(#TextMorph #authoringPrototype 'Text' 'Text that you can edit into anything you desire.' ) #(#SimpleSliderMorph #authoringPrototype 'Slider' 'A slider for showing and setting numeric values.' ) #(#JoystickMorph #authoringPrototype 'Joystick' 'A joystick-like control' ) #(#ScriptingSystem #prototypicalHolder 'Holder' 'A place for storing alternative pictures in an animation, ec.' ) #(#ScriptableButton #authoringPrototype 'Button' 'A Scriptable button' ) #(#PasteUpMorph #authoringPrototype 'Playfield' 'A place for assembling parts or for staging animations' ) #(#BookMorph #authoringPrototype 'Book' 'A multi-paged structure' ) #(#TabbedPalette #authoringPrototype 'Tabs' 'A structure with tabs' ) #(#RecordingControlsMorph #authoringPrototype 'Sound' 'A device for making sound recordings.' ) #(#MagnifierMorph #newRound 'Magnifier' 'A magnifying glass' ) #(#ImageMorph #authoringPrototype 'Picture' 'A non-editable picture of something' ) #(#ClockMorph #authoringPrototype 'Clock' 'A simple digital clock' ) #(#BookMorph #previousPageButton 'Previous' 'A button that takes you to the previous page' ) #(#BookMorph #nextPageButton 'Next' 'A button that takes you to the next page' ) ).
	_gsSqueakTemp_aFlapTab := FlapTab new referent: _gsSqueakTemp_aStrip beSticky.
	_gsSqueakTemp_aFlapTab
		setName: 'Supplies' translated
		edge: #bottom
		color: Color red lighter.
	_gsSqueakTemp_aStrip extent: self currentWorld width @ 78.
	_gsSqueakTemp_leftEdge := Display width - (16 + _gsSqueakTemp_aFlapTab width) + 556 // 2.
	_gsSqueakTemp_aFlapTab position: _gsSqueakTemp_leftEdge @ (self currentWorld height - _gsSqueakTemp_aFlapTab height).
	_gsSqueakTemp_aStrip beFlap: true.
	_gsSqueakTemp_aStrip autoLineLayout: true.
	^ _gsSqueakTemp_aFlapTab