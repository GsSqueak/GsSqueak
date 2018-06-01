command line
vmPath
	"Answer the path for the directory containing the Smalltalk virtual machine, making sure to convert the vm string to a Squeak string as required."
	"Smalltalk vmPath"

	^self primVmPath vmPathToSqueakPath
