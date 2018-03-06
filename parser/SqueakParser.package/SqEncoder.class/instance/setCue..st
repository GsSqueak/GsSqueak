private
setCue: aCue 
	cue := aCue.
	"Also set legacy instance variables for methods that
	don't use cue yet"
	class := cue getClass