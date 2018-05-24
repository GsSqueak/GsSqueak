accessing
autoFit: trueOrFalse
	"Whether I automatically adjust my size to fit text as it changes"
	
	self isAutoFit = trueOrFalse ifTrue: [^ self].
	self autoFitOnOff.