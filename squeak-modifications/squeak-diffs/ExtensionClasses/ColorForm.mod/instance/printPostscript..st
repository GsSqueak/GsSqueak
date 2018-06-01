*Morphic-MorphicExtras-*morphic-Postscript Canvases
printPostscript:aStream
	aStream nextPutAll:'% form contains '; 
			print:((colors select:[:c| c=Color transparent]) size); 
			nextPutAll:' transparent colors'; cr.
	^self asFormWithSingleTransparentColors printPostscript:aStream operator:(self depth=1 ifTrue:['imagemask'] 
	ifFalse:[ (self indexOfColor:Color transparent) printString ,' transparentimage']) .
