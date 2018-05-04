path access
sourcePathText
	"return a Text for the path to the generated sources"
	^[vmMaker sourceDirectory fullName asText] 
		on: VMMakerException 
		do:[:ex| ex return:'<path not valid>'].