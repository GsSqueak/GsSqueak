initialization
initializeObjectWordConstants

	Byte0Shift := 0.
	Byte1Shift := 8.
	Byte2Shift := 16.
	Byte3Shift := 24.
	Byte4Shift := 32.
	Byte5Shift := 40.
	Byte6Shift := 48.
	Byte7Shift := 56.

	Byte0Mask := 16r00000000000000FF.
	Byte1Mask := 16r000000000000FF00.
	Byte2Mask := 16r0000000000FF0000.
	Byte3Mask := 16r00000000FF000000.
	Byte4Mask := 16r000000FF00000000.
	Byte5Mask := 16r0000FF0000000000.
	Byte6Mask := 16r00FF000000000000.
	Byte7Mask := 16rFF00000000000000.
	Bytes3to0Mask := 16r00000000FFFFFFFF.
	Bytes7to4Mask := 16rFFFFFFFF00000000.
							
	Byte1ShiftNegated := Byte1Shift negated.
	Byte3ShiftNegated := Byte3Shift negated.
	Byte4ShiftNegated := Byte4Shift negated.
	Byte5ShiftNegated := Byte5Shift negated.
	Byte7ShiftNegated := Byte7Shift negated