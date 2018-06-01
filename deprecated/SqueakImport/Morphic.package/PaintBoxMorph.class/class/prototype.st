instance creation
prototype
	"Later we will be a subclass of Model, and it will have a general version of this"
	^ Prototype ifNil: [Prototype := self newPrototype]