instance creation
withForm: aForm 
	"Note: 'SketchMorph withForm: zz' is MUCH faster
	than 'SketchMorph new form: zz'."
	^ self basicNew initializeWith: aForm