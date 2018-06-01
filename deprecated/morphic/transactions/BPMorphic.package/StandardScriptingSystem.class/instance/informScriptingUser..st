-Etoys-utilities
informScriptingUser: aString 
	"This provides a hook for logging messages that the user or the
	developer may wish to see; at present it simply logs the message to
	the Transcript, with a standard prefix to signal their provenance.
	Such messages will fall on the floor if there is no Transcript window
	open "
	Transcript cr; show: 'SCRIPT NOTE: ' , aString