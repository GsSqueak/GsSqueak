read write
uniClasesDo: aBlock
	"Examine structures and execute the block with each instance-specific class"

	
	structures keysDo: [:clsName | | cls | 
		(clsName endsWith: ' class') ifFalse: [
			(cls := Smalltalk at: clsName) isSystemDefined ifFalse: [
					aBlock value: cls]]]