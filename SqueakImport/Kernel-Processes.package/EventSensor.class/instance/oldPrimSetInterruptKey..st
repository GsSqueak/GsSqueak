primitives-fallback
oldPrimSetInterruptKey: anInteger
	"Primitive. Register the given keycode as the user interrupt key. The low byte of the keycode is the ISO character and its next four bits are the Smalltalk modifer bits <cmd><opt><ctrl><shift>."

	<primitive: 133>
	^self primitiveFailed
"Note: This primitive is obsolete with the new event driven architecture in which EventSensor can handle the interrupts itself. However, for supporting older images running on newer VMs the primitive must still be implemented."