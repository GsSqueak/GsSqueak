-Etoys-utilities
reportToUser: aString 
	"Make a message accessible to the user. For the moment, we simply
	defer to the Transcript mechanism"
	Transcript cr; show: aString