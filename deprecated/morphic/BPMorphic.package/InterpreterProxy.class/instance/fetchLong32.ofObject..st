object access
fetchLong32: fieldIndex ofObject: oop 
	"index by 32-bit units, and return a 32-bit value. Intended to replace
	fetchWord:ofObject: "
	"fetchWord:ofObject: is rescinded as of VMMaker 3.8 64bit VM. This is
	the same code as
	used therein and may need revision for 64 bit cleanliness"
	^ oop instVarAt: fieldIndex + 1