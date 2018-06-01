input
bufferTimeStampFrom: aByteArray
	"Return the timestamp from the given MIDI input buffer. Assume the given buffer is at least 4 bytes long."

	^ ((aByteArray at: 1) bitShift: 24) +
	  ((aByteArray at: 2) bitShift: 16) +
	  ((aByteArray at: 3) bitShift: 8) +
	   (aByteArray at: 4)
