drawing
visible: aBoolean 
	"set the 'visible' attribute of the receiver to aBoolean"
	(extension isNil and:[aBoolean]) ifTrue: [^ self].
	self visible == aBoolean ifTrue: [^ self].
	self assureExtension visible: aBoolean.
	self changed