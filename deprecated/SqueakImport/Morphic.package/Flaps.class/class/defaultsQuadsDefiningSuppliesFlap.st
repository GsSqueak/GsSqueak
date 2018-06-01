flaps registry
defaultsQuadsDefiningSuppliesFlap
	"Answer a list of quads which define the objects to appear in the default Supplies flap.
	previously in quadsDefiningSuppliesFlap"

	^ {
	{#RectangleMorph. 	#authoringPrototype.		'Rectangle' 	translatedNoop.	'A rectangle' translatedNoop}.
	{#RectangleMorph.	#roundRectPrototype.		'RoundRect' translatedNoop.		'A rectangle with rounded corners' translatedNoop}.
	{#EllipseMorph.		#authoringPrototype.		'Ellipse' translatedNoop.			'An ellipse or circle' translatedNoop}.
	{#StarMorph.		#authoringPrototype.		'Star' translatedNoop.			'A star' translatedNoop}.
	{#PolygonMorph.		#curvePrototype.		'Curve' translatedNoop.			'A curve' translatedNoop}.
	{#PolygonMorph.	#authoringPrototype.		'Polygon' translatedNoop.		'A straight-sided figure with any number of sides' translatedNoop}.
	{#TextMorph	.		#authoringPrototype.	'Text' translatedNoop.			'Text that you can edit into anything you desire.' translatedNoop}.
	{#ScriptingSystem.	#prototypicalHolder. 		'Holder' translatedNoop.			'A place for storing alternative pictures in an animation, etc.' translatedNoop}.
	{#ImageMorph.		#authoringPrototype.		'Picture' translatedNoop.		'A non-editable picture of something' translatedNoop}.
	{#ScriptableButton.	#authoringPrototype.		'Button' translatedNoop.			'A Scriptable button' translatedNoop}.
	{#SimpleSliderMorph.	#authoringPrototype.	'Slider' translatedNoop.			'A slider for showing and setting numeric values.' translatedNoop}.
	{#PasteUpMorph.	#authoringPrototype.		'Playfield' translatedNoop.		'A place for assembling parts or for staging animations' translatedNoop}.
	{#BookMorph.		#authoringPrototype.		'Book' translatedNoop.			'A multi-paged structure' translatedNoop}.
	{#TabbedPalette.		#authoringPrototype.		'TabbedPalette' translatedNoop.	'A structure with tabs' translatedNoop}.
	{#JoystickMorph	.	#authoringPrototype.		'Joystick' translatedNoop.		'A joystick-like control' translatedNoop}.
	{#ClockMorph.		#authoringPrototype.		'Clock' translatedNoop.			'A simple digital clock' translatedNoop}.
	{#BookMorph.		#previousPageButton. 		'PreviousPage' translatedNoop.	'A button that takes you to the previous page' translatedNoop}.
	{#BookMorph.		#nextPageButton.			'NextPage' translatedNoop.		'A button that takes you to the next page' translatedNoop}
} asOrderedCollection