instance creation
newTranscript: aTextCollector 
	"Store aTextCollector as the value of the system global Transcript."
	Smalltalk at: #Transcript put: aTextCollector