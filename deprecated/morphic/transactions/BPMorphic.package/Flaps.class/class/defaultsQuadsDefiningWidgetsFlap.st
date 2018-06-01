flaps registry
defaultsQuadsDefiningWidgetsFlap
	"Answer a structure defining the default Widgets flap.
	previously in quadsDefiningWidgetsFlap"
	"(AllScriptsTool			allScriptsToolForActiveWorld	'All
	Scripts' 'A tool that lets you see and control all the running
	scripts in your project')"
	"(MPEGMoviePlayerMorph	authoringPrototype		'Movie
	Player'		'A Player for MPEG movies')"
	"(ScriptingSystem		newScriptingSpace			'Scripting'	
	'A confined place for drawing and scripting, with its own
	private stop/step/go buttons.')
	(ScriptingSystem		holderWithAlphabet			'Alphabet'	
	'A source for single-letter objects')
	(BouncingAtomsMorph	new						'Bouncing
	Atoms'	'Atoms, mate')"
	^ #(#(#TrashCanMorph #new 'Trash' 'A tool for discarding objects' ) #(#PaintInvokingMorph #new 'Paint' 'Drop this into an area to start making a fresh painting there' ) #(#GeeMailMorph #new 'Gee-Mail' 'A place to present annotated content' ) #(#RecordingControlsMorph #authoringPrototype 'Sound' 'A device for making sound recordings.' ) #(#FrameRateMorph #authoringPrototype 'Frame
Rate' 'An indicator of how fast your system is running' ) #(#MagnifierMorph #newRound 'Magnifier' 'A magnifying glass' ) #(#ObjectsTool #newStandAlone 'Object
Catalog' 'A tool that lets you browse the catalog of objects' ) ) asOrderedCollection