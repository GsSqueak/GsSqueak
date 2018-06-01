macro transformations
transform: encoder
  ^ false	"Für die Tags: hackidy hack HACK todo special = 0
		ifTrue: [^ false].
	(self
			perform: (MacroTransformers at: special)
			with: encoder)
		ifTrue: [^ true]
		ifFalse: [special := 0.
			^ false]"