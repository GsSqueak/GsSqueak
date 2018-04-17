as yet unclassified
signalForException: anError
	"Very important entry point for analysis stack when stepping in a debugging session. See Process >> #stepToHome: for further explanations."
	
	^ self new
		exception: anError;
		signal