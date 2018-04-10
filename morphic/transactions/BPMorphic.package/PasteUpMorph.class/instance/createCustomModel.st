model
createCustomModel
	"Create a model object for this world if it does not yet have one. A
	model object is an initially empty subclass of MorphicModel. As the
	user names parts and adds behavior, instance variables and methods
	are added to this class."
	model isNil
		ifFalse: [^ self].
	model := MorphicModel newSubclass new