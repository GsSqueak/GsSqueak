classes and traits
removeClassNamed: aName
	"DO NOT DEPRECATE - Invoked from fileouts. If there is currently a class in the system named aName, then remove it.  If anything untoward happens, report it in the Transcript.  "

	^globals removeClassNamed: aName
