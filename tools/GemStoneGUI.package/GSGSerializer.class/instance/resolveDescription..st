resolution
resolveDescription: description

	| type spec |
	description isAssociation
		ifTrue: [	type := description key.
				spec := description value]
		ifFalse: [type := description.
				spec := Array new].
	(self isPrimitiveType: type) ifTrue: [
		^ self addPrimitiveType: type withSpec: spec].
	(self isCompositeType: type) ifTrue: [
		^ self addCompositeType: type withSpec: spec].
	(self isDescription: spec) ifTrue: [
		^ self addRuleType: type withSpec: spec].
	self unresolvedType: type