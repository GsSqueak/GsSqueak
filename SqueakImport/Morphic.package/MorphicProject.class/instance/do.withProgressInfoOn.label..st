utilities
do: aBlock withProgressInfoOn: aMorphOrNil label: aString
	"Evaluate aBlock with a labeled progress bar"

	ComplexProgressIndicator new 
		targetMorph: aMorphOrNil;
		historyCategory: aString;
		withProgressDo: aBlock
