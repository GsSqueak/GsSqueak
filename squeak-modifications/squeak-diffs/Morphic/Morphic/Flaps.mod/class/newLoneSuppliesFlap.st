predefined flaps
newLoneSuppliesFlap
	"Answer a fully-instantiated flap named 'Supplies' to be placed at the bottom of the screen, for use when it is the only flap shown upon web launch.  We're still evidently nurturing this method along, but it is a disused branch, whose lone sender has no senders..."

	|  aFlapTab aStrip leftEdge |  "Flaps setUpSuppliesFlapOnly"
	aStrip := PartsBin newPartsBinWithOrientation: #leftToRight andColor: Color red muchLighter from:	 {

	{#TrashCanMorph. #new	. 'Trash' translatedNoop. 'A tool for discarding objects' translatedNoop}.	
	{#ScriptingSystem. #scriptControlButtons. 'Status'	translatedNoop. 'Buttons to run, stop, or single-step scripts' translatedNoop}.
	{#AllScriptsTool.    #allScriptsToolForActiveWorld. 'All Scripts' translatedNoop. 'A tool that lets you control all the running scripts in your world' translatedNoop}.

	{#PaintInvokingMorph. #new. 'Paint' translatedNoop.	'Drop this into an area to start making a fresh painting there' translatedNoop}.
	{#RectangleMorph. #authoringPrototype. 'Rectangle' translatedNoop. 'A rectangle' translatedNoop}.
	{#RectangleMorph. #roundRectPrototype. 'RoundRect'	 translatedNoop. 'A rectangle with rounded corners' translatedNoop}.
	{#EllipseMorph.	#authoringPrototype.	'Ellipse' translatedNoop. 'An ellipse or circle' translatedNoop}.
	{#StarMorph. 	#authoringPrototype.	'Star' translatedNoop. 	'A star' translatedNoop}.
	{#PolygonMorph.	#curvePrototype.	'Curve'	translatedNoop. 'A curve' translatedNoop}.
	{#PolygonMorph	. #authoringPrototype.	'Polygon' translatedNoop. 'A straight-sided figure with any number of sides' translatedNoop}.
	{#TextMorph	.	#authoringPrototype. 	'Text' translatedNoop.	'Text that you can edit into anything you desire.' translatedNoop}.
	{#SimpleSliderMorph	.	#authoringPrototype.	'Slider' translatedNoop.	'A slider for showing and setting numeric values.' translatedNoop}.
	{#JoystickMorph	.	#authoringPrototype.	'Joystick' translatedNoop. 	'A joystick-like control' translatedNoop}.
	{#ScriptingSystem.	#prototypicalHolder.		'Holder'	translatedNoop.		'A place for storing alternative pictures in an animation, etc.' translatedNoop}.
"	{#ScriptableButton.	#authoringPrototype.	'Button'	 translatedNoop.		'A Scriptable button' translatedNoop}."
	{#PasteUpMorph.	#authoringPrototype.	'Playfield' translatedNoop.	'A place for assembling parts or for staging animations' translatedNoop}.
	{#BookMorph.		#authoringPrototype.	'Book' translatedNoop.		'A multi-paged structure' translatedNoop}.
	{#TabbedPalette.		#authoringPrototype.	'Tabs' translatedNoop.		'A structure with tabs' translatedNoop}.

	{#RecordingControls.	#authoringPrototype.	'Sound Recorder' translatedNoop. 'A device for making sound recordings.' translatedNoop}.
	{#MagnifierMorph.	#newRound	.			'Magnifier' translatedNoop.		'A magnifying glass' translatedNoop}.

	{#ImageMorph.		#authoringPrototype.	'Picture' translatedNoop. 	'A non-editable picture of something' translatedNoop}.
	{#ClockMorph.		#authoringPrototype,	'Clock' translatedNoop, 	'A simple digital clock' translatedNoop}.
	{#BookMorph,		#previousPageButton,	'Previous' translatedNoop, 'A button that takes you to the previous page' translatedNoop}.
	{#BookMorph,		#nextPageButton,		'Next' translatedNoop,	'A button that takes you to the next page' translatedNoop}.
}.

	aFlapTab := FlapTab new referent: aStrip beSticky.
	aFlapTab setName: 'Supplies' translated edge: #bottom color: Color red lighter.

	aStrip extent: self currentWorld width @ 78.
	leftEdge := ((Display width - (16  + aFlapTab width)) + 556) // 2.

	aFlapTab position: (leftEdge @ (self currentWorld height - aFlapTab height)).

	aStrip beFlap: true.
	aStrip autoLineLayout: true.
	
	^ aFlapTab