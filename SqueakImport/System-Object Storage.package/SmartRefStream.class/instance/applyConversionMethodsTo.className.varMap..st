import image segment
applyConversionMethodsTo: objectIn className: className varMap: varMap
	"Modify the object's instance vars to have the proper values
for its new shape.  Mostly, fill in defaut values of new inst vars.
Can substitute an object of a different class.  (Beware: if
substituted, varMap will not be correct when the new object is asked
to convert.)"
	| anObject prevObject |

	self flag: #bobconv.

	anObject := objectIn.
	[
		prevObject := anObject.
		anObject := anObject convertToCurrentVersion: varMap
refStream: self.
		prevObject == anObject
	] whileFalse.
	^anObject