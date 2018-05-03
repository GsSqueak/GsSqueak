page access
pageIndexFor: pointer "<Integer>" stackMemory: stackmem "<Integer>" bytesPerPage: pageByteSize "<Integer>"
	"Answer the page index for a pointer into stack memory, i.e. the index
	 for the page the address is in.  N.B.  This is a zero-relative index."

	<var: #pointer type: 'char *'>
	self flag: #FIXME. "dtl - oscog original source below for reference. Was coded to use C macro at code
					generation time, such that the Smalltalk would run in simulation. Maybe too clever by half.
					For now write it in slang and implement simulator override later. If the C macro
					approach is needed, adopt it from the oscog code generator, see #definedAsMacro.
					But note that C macros provide no performance benefit, and add obfuscation."

	^ pointer - stackmem - 1 / pageByteSize

	"| memIndex |
	<cmacro: '(pointer,stackmem,pageByteSize) (((char *)(pointer) - (stackmem) - 1) / (pageByteSize))'>
	memIndex := self memIndexFor: pointer.
	self assert: (memIndex between: 1 and: stackMemory size).
	^memIndex - 1 // pageSizeInSlots"