read write
saveClassInstVars
	"Install the values of the instance variables of UniClasses.
classInstVars is an array of arrays (#Player3 (Player3 class's inst var
scripts) (Player3 class's inst var slotInfo) ...) "

	| normal clsPoolIndex |
	classInstVars := OrderedCollection new: 100.
	normal := Object class instSize.
	clsPoolIndex := Object class allInstVarNames indexOf: 'classPool'.
	self uniClasesDo: [:aUniClass | | list mySize |
		list := OrderedCollection new.
		mySize := aUniClass class instSize.
		mySize = normal ifFalse:
			[list add: aUniClass name.	"a symbol"
			list add: 'Update to read classPool'.	"new
convention for saving the classPool"
			list add: (aUniClass instVarAt: clsPoolIndex)
"classPool".
						"write actual value of nil
instead of Dictionary()"
			normal + 1 to: mySize do: [:ii |
				list addLast: (aUniClass instVarAt: ii)].
			classInstVars add: list asArray]].
	classInstVars := classInstVars asArray.
	