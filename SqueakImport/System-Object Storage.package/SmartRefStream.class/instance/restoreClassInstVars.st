read write
restoreClassInstVars
	"Install the values of the class instance variables of UniClasses
(i.e. scripts slotInfo).  classInstVars is ((#Player25 scripts slotInfo)
...).  Thank you Mark Wai for the bug fix."

	| normal trans classPlayer |

	self flag: #bobconv.	

	classPlayer := Smalltalk at: #Player ifAbsent:[^self].

	self moreObjects ifFalse: [^ self]. 	"are no UniClasses with class inst vars"
	classInstVars := super next.	"Array of arrays"
	normal := Object class instSize.	"might give trouble if Player class superclass changes size"
	(structures at: #Player ifAbsent: [#()]) = #(0 'dependents' 'costume') ifTrue:
		[trans := 1].	"now (0 costume costumes).  Do the conversion of Player class
			inst vars in Update 509."
	classInstVars do: [:list | | aName newCls rList newName start |
		aName := (list at: 1) asSymbol.
		rList := list.
		newName := renamed at: aName ifAbsent: [aName].
		newCls := Smalltalk at: newName
				ifAbsent: [self error: 'UniClass definition missing'].
		("old conversion" trans = 1 and: [newCls inheritsFrom: classPlayer]) ifTrue: [
			"remove costumeDictionary from Player class inst vars"
			rList := rList asOrderedCollection.
			rList removeAt: 4].	"costumeDictionary's value"
		start := list second = 'Update to read classPool' ifTrue: [4] ifFalse: [2].
		newCls class instSize = (normal + (rList size) - start + 1) ifFalse:
			[self error: 'UniClass superclass class has changed size'].
			"Need to install a conversion method mechanism"
		start = 4 ifTrue: [newCls instVarAt: normal - 1 "classPool" put: (list at: 3)].
		start to: rList size do: [:ii |
			newCls instVarAt: normal + ii - start + 1 put: (rList at: ii)]].
