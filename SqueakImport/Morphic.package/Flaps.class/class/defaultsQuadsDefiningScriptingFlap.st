flaps registry
defaultsQuadsDefiningScriptingFlap
	"Answer a structure defining the default items in the Scripting flap.
	previously in quadsDeiningScriptingFlap"

	^ {
	{#TrashCanMorph.		#new.							'Trash' translatedNoop. 	'A tool for discarding objects' translatedNoop}.	
	{#ScriptingSystem.		#scriptControlButtons.			'Status' translatedNoop.	'Buttons to run, stop, or single-step scripts' translatedNoop}.
	{#AllScriptsTool.			#allScriptsToolForActiveWorld.	'All Scripts' translatedNoop.	'A tool that lets you control all the running scripts in your world' translatedNoop}.
	{#ScriptingSystem.		#newScriptingSpace.		'Scripting' translatedNoop. 	'A confined place for drawing and scripting, with its own private stop/step/go buttons.' translatedNoop}.

	{#PaintInvokingMorph.	#new.		'Paint' translatedNoop.	'Drop this into an area to start making a fresh painting there' translatedNoop}.
	{#ScriptableButton.		#authoringPrototype.	'Button' translatedNoop.		'A Scriptable button' translatedNoop}.
	{#ScriptingSystem.		#prototypicalHolder.		'Holder' translatedNoop.		'A place for storing alternative pictures in an animation, etc.' translatedNoop}.
	{#FunctionTile.			#randomNumberTile.	'Random' translatedNoop.	'A tile that will produce a random number in a given range' translatedNoop}.
	{#ScriptingSystem.		#anyButtonPressedTiles.	'ButtonDown?' translatedNoop.	'Tiles for querying whether the mouse button is down' translatedNoop}.
	{#ScriptingSystem.		#noButtonPressedTiles.	'ButtonUp?' translatedNoop.		'Tiles for querying whether the mouse button is up' translatedNoop}.

	{#SimpleSliderMorph.	#authoringPrototype.	'Slider' translatedNoop.		'A slider for showing and setting numeric values.' translatedNoop}.
	{#JoystickMorph	.		#authoringPrototype.	'Joystick' translatedNoop.	'A joystick-like control' translatedNoop}.
	{#TextFieldMorph.		#exampleBackgroundField.	'Scrolling Field'	translatedNoop. 'A scrolling data field which will have a different value on every card of the background' translatedNoop}.

	{#PasteUpMorph.	#authoringPrototype.		'Playfield' translatedNoop.	'A place for assembling parts or for staging animations' translatedNoop}.


	{#StackMorph. 		#authoringPrototype.		'Stack' translatedNoop. 		'A multi-card data base'	translatedNoop}.
	{#TextMorph.		#exampleBackgroundLabel.	'Background Label' translatedNoop. 'A piece of text that will occur on every card of the background' translatedNoop}.
	{#TextMorph	.		#exampleBackgroundField.	'Background Field' translatedNoop. 'A data field which will have a different value on every card of the background' translatedNoop}
} asOrderedCollection