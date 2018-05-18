as yet unclassified
mouseUp: anEvent 

	target ifNil: [^ self].
	target fastFramingOn ifFalse: [
		(self valueOfProperty: #targetHadDropShadow ifAbsent: [false]) ifTrue: [target hasDropShadow: true].
		self removeProperty: #targetHadDropShadow].