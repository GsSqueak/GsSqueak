resolution
addPrimitiveType: type withSpec: spec

	self addPrimitiveTransformation: type.
	type = #Array ifTrue: [
		spec do: [:description |	self resolveDescription: description]].
	type = #Composite ifTrue: [
		self addPrimitiveType: #Array withSpec: spec]