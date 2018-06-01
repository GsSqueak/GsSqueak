drag and drop
dragFromMessageList: index
	"Drag a method from the browser"
	^self selectedClassOrMetaClass compiledMethodAt: (self messageList at: index) ifAbsent:[nil]