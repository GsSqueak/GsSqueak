image save/restore
getImageHeaderFlags
	"Answer the flags that are contained in the 7th long of the image
	header. "
	^ fullScreenFlag
		+ (VMBIGENDIAN
				ifTrue: ["0 or 1"
					0]
				ifFalse: [2])
		+ (preemptionYields
				ifTrue: ["this is the imageFloatsLittleEndian flag"
					0]
				ifFalse: [16])
		+ (newFinalization
				ifTrue: [64]
				ifFalse: [0])
		+ (imageHeaderFlags bitClear: 83)"these are any flags we do not recognize"