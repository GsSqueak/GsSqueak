scripting
defaultNameStemForInstances
	"The code just below, now commented out, resulted in every instance
	of every sublcass of AlignmentMorph being given a default name of
	the form 'Alignment1', rather than the desired 'MoviePlayer1',
	'ScriptEditor2', etc."
	"^ 'Alignment'"
	^ super defaultNameStemForInstances