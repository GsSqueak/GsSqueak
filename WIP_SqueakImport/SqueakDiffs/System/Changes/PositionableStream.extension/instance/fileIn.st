*System-Changes-fileIn/Out
fileIn
	"This is special for reading expressions from text that has been formatted 
	with exclamation delimitors. The expressions are read and passed to the 
	Compiler. Answer the result of compilation."

	^ self fileInAnnouncing: 'Reading ' , self name