import image segment
convert2: partiallyCorrectInst allVarMaps: allVarMaps
	"Go through the normal instance conversion process and return a modern object."

	| className varMap |

	self flag: #bobconv.	

	varMap := allVarMaps at: partiallyCorrectInst.
	className := varMap at: #ClassName.	"original"
	^self applyConversionMethodsTo: partiallyCorrectInst className: className varMap: varMap.

