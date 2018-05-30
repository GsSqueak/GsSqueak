as yet unclassified
mouseDown: anEvent 
	"Disable drop shadow to improve performance."

	super mouseDown: anEvent.

	target ifNil: [^ self].
	target fastFramingOn ifFalse: [
		self setProperty: #targetHadDropShadow toValue: target hasDropShadow.
		target hasDropShadow: false].