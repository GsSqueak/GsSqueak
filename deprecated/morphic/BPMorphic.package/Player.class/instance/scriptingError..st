scripts-execution
scriptingError: aMessage 
	"An error arose, characterized by aMessage, when a script was being
	run. For the moment, we report it to the transcript only"
	Transcript cr; show: 'Scripting error for ' , self externalName , ': ' , aMessage