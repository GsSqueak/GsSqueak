class variables
removeClassVarName: aString 
	"Remove the class variable whose name is the argument, aString, from 
	the names defined in the receiver, a class. Create an error notification if 
	aString is not a class variable or if it is still being used in the code of 
	the class."

	| aSymbol |
	aSymbol := aString asSymbol.
	(classPool includesKey: aSymbol)
		ifFalse: [^self error: aString, ' is not a class variable'].
	self withAllSubclasses do:[:subclass |
		(Array with: subclass with: subclass class) do:[:classOrMeta |
			(classOrMeta whichSelectorsReferTo: (classPool associationAt: aSymbol))
				isEmpty ifFalse: [
					InMidstOfFileinNotification signal ifTrue: [
						Transcript cr; show: self name, ' (' , aString , ' is Undeclared) '.
						^self environment undeclare: aSymbol from: classPool].
					(self confirm: (aString,' is still used in code of class ', classOrMeta name,
						'.\Is it okay to move it to Undeclared?') withCRs)
						ifTrue:[^ self environment undeclare: aSymbol from: classPool]
						ifFalse:[^self]]]].
	classPool removeKey: aSymbol.
	classPool isEmpty ifTrue: [classPool := nil].
