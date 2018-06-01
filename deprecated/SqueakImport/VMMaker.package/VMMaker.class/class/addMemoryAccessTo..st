utilities
addMemoryAccessTo: aCodeGenerator
	"Add MemoryAccess is if assigned to a variable. To do: add instance var and reference
	low level memory though as an instance of MemoryAccess."

	Smalltalk at: #MemoryAccess ifPresent: [ :ma |
		ma isEnabled ifTrue: [ aCodeGenerator addClass: ma selectorPrefix: 'bits' ]]