primitive support
getStackPointer
	"For Alien FFI"
	^ self cCoerce: stackPointer to: #'sqInt *'