evaluating logged
evaluate: textOrString in: anEnvironment notifying: aController logged: logFlag
	"Compile and execute the argument, textOrString in anEnvironment.
	If a compilation error occurs, notify aController. If both 
	compilation and execution are successful then, if logFlag is true, log 
	(write) the text onto a system changes file so that it can be replayed if 
	necessary."

	^ self new
				evaluate: textOrString
				in: anEnvironment
				notifying: aController
				logged: logFlag.