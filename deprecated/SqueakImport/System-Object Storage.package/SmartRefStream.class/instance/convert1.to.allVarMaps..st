import image segment
convert1: misShapenInst to: goodClass allVarMaps: allVarMaps
	"Go through the normal instance conversion process and return a modern object."

	| className oldInstVars anObject varMap |

	self flag: #bobconv.	

	goodClass isVariable ifTrue: [
		goodClass error: 'shape change for variable class not implemented yet'
	].
	(misShapenInst class name beginsWith: 'Fake37') ifFalse: [self error: 'why mapping?'].
	className := (misShapenInst class name allButFirst: 6) asSymbol.
	oldInstVars := structures at: className.
	anObject := goodClass basicNew.

	varMap := Dictionary new.	"later, indexed vars as (1 -> val) etc."
	2 to: oldInstVars size do: [:ind |
		varMap at: (oldInstVars at: ind) put: (misShapenInst instVarAt: ind-1)].
	varMap at: #ClassName put: className.	"original"
	varMap at: #NewClassName put: goodClass name.	"new"
	self storeInstVarsIn: anObject from: varMap. 	"ones with the same names"
	allVarMaps at: misShapenInst put: varMap.
	^ anObject
