initialization history
initializePrimitiveTable19961028Squeak11
	"From changes file of Squeak 1.1, and remaining in effect through Squeak 1.17"

	"'From Squeak 1.1 of September 21, 1996 on 23 September 1996 at 8:34:59 pm'!"
"initializePrimitiveTable"
	"Interpreter initializePrimitiveTable"
	"Note: This table will be used to generate a C switch statement."

	PrimitiveTable _ Array new: 256.
	self table: PrimitiveTable from: 
	#(
		"Integer Primitives (0-19)"
		(0 primitiveFail)
		(1 primitiveAdd)
		(2 primitiveSubtract)
		(3 primitiveLessThan)
		(4 primitiveGreaterThan)
		(5 primitiveLessOrEqual)
		(6 primitiveGreaterOrEqual)
		(7 primitiveEqual)
		(8 primitiveNotEqual)
		(9 primitiveMultiply)
		(10 primitiveDivide)
		(11 primitiveMod)
		(12 primitiveDiv)
		(13 primitiveQuo)
		(14 primitiveBitAnd)
		(15 primitiveBitOr)
		(16 primitiveBitXor)
		(17 primitiveBitShift)
		(18 primitiveMakePoint)
		(19 primitiveFail)

		"LargeInteger Primitives (20-39)"
		"32-bit logic is aliased to Integer prims above"
		(20 39 primitiveFail)

		"Float Primitives (40-59)"
		(40 primitiveAsFloat)
		(41 primitiveFloatAdd)
		(42 primitiveFloatSubtract)
		(43 primitiveFloatLessThan)
		(44 primitiveFloatGreaterThan)
		(45 primitiveFloatLessOrEqual)
		(46 primitiveFloatGreaterOrEqual)
		(47 primitiveFloatEqual)
		(48 primitiveFloatNotEqual)
		(49 primitiveFloatMultiply)
		(50 primitiveFloatDivide)
		(51 primitiveTruncated)
		(52 primitiveFractionalPart)
		(53 primitiveExponent)
		(54 primitiveTimesTwoPower)
		(55 59 primitiveFail)

		"Subscript and Stream Primitives (60-67)"
		(60 primitiveAt)
		(61 primitiveAtPut)
		(62 primitiveSize)
		(63 primitiveStringAt)
		(64 primitiveStringAtPut)
		(65 primitiveNext)
		(66 primitiveNextPut)
		(67 primitiveAtEnd)

		"StorageManagement Primitives (68-79)"
		(68 primitiveObjectAt)
		(69 primitiveObjectAtPut)
		(70 primitiveNew)
		(71 primitiveNewWithArg)
		(72 primitiveFail)					"Blue Book: primitiveBecome"
		(73 primitiveInstVarAt)
		(74 primitiveInstVarAtPut)
		(75 primitiveAsOop)
		(76 primitiveFail)					"Blue Book: primitiveAsObject"
		(77 primitiveSomeInstance)
		(78 primitiveNextInstance)
		(79 primitiveNewMethod)

		"Control Primitives (80-89)"
		(80 primitiveFail)   					"Blue Book:  primitiveBlockCopy"
		(81 primitiveValue)
		(82 primitiveValueWithArgs)
		(83 primitivePerform)
		(84 primitivePerformWithArgs)
		(85 primitiveSignal)
		(86 primitiveWait)
		(87 primitiveResume)
		(88 primitiveSuspend)
		(89 primitiveFlushCache)

		"Input/Output Primitives (90-109)"
		(90 primitiveMousePoint)
		(91 primitiveFail)					"Blue Book: primitiveCursorLocPut"
		(92 primitiveFail)					"Blue Book: primitiveCursorLink"
		(93 primitiveInputSemaphore)
		(94 primitiveFail)					"Blue Book: primitiveSampleInterval"
		(95 primitiveInputWord)
		(96 primitiveCopyBits)
		(97 primitiveSnapshot)
		(98 primitiveFail)					"Blue Book: primitiveTimeWordsInto"
		(99 primitiveFail)					"Blue Book: primitiveTickWordsInto"
		(100 primitiveFail)					"Blue Book: primitiveSignalAtTick"
		(101 primitiveBeCursor)
		(102 primitiveBeDisplay)
		(103 primitiveScanCharacters)
		(104 primitiveDrawLoop)
		(105 primitiveStringReplace)
		(106 primitiveScreenSize)
		(107 primitiveMouseButtons)
		(108 primitiveKbdNext)
		(109 primitiveKbdPeek)

		"System Primitives (110-119)"
		(110 primitiveEquivalent)
		(111 primitiveClass)
		(112 primitiveBytesLeft)
		(113 primitiveQuit)
		(114 primitiveExitToDebugger)
		(115 primitiveFail)					"Blue Book: primitiveOopsLeft"
		(116 primitiveFail)
		(117 primitiveFail)
		(118 primitiveFail)
		(119 primitiveFail)

		"Miscellaneous Primitives (120-127)"
		(120 primitiveFail)
		(121 primitiveImageName)
		(122 primitiveNoop)				"Blue Book: primitiveImageVolume"
		(123 primitiveFail)
		(124 primitiveLowSpaceSemaphore)
		(125 primitiveSignalAtBytesLeft)
		(126 primitiveFail)
		(127 primitiveFail)

		"AppleSmalltalk Primitives Start Here"

		"Apple Miscellaneous Primitives (128-149)"
		(128 primitiveArrayBecome)
		(129 primitiveSpecialObjectsOop)
		(130 primitiveFullGC)
		(131 primitiveIncrementalGC)
		(132 primitiveObjectPointsTo)
		(133 primitiveSetInterruptKey)
		(134 primitiveInterruptSemaphore)
		(135 primitiveMillisecondClock)
		(136 primitiveSignalAtMilliseconds)
		(137 primitiveSecondsClock)
		(138 primitiveSomeObject)
		(139 primitiveNextObject)
		(140 primitiveBeep)
		(141 primitiveClipboardText)
		(142 primitiveVMPath)
		(143 primitiveShortAt)
		(144 primitiveShortAtPut)
		(145 primitiveConstantFill)
		(146 primitiveReadJoystick)
		(147 primitiveWarpBits)
		(148 149 primitiveFail)

		"File Primitives (150-169)"
		(150 primitiveFileAtEnd)
		(151 primitiveFileClose)
		(152 primitiveFileGetPosition)
		(153 primitiveFileOpen)
		(154 primitiveFileRead)
		(155 primitiveFileSetPosition)
		(156 primitiveFileDelete)
		(157 primitiveFileSize)
		(158 primitiveFileWrite)
		(159 primitiveFileRename)
		(160 primitiveDirectoryCreate)
		(161 primitiveDirectoryDelimitor)
		(162 primitiveDirectoryLookup)
		(163 168 primitiveFail)
		(169 primitiveDirectorySetMacTypeAndCreator)

		"Sound Primitives (170-199)"
		(170 primitiveSoundStart)
		(171 primitiveFail)
		(172 primitiveSoundStop)
		(173 primitiveSoundAvailableSpace)
		(174 primitiveSoundPlaySamples)
		(175 primitiveSoundPlaySilence)
		(176 primWaveTableSoundmixSampleCountintostartingAtpan)
		(177 primFMSoundmixSampleCountintostartingAtpan)
		(178 primPluckedSoundmixSampleCountintostartingAtpan)
		(179 199 primitiveFail)

		"Unimplemented Primitives (200-249)"
		(200 249 primitiveFail)

		"VM Implementor Primitives (250-255)"
		(250 clearProfile)
		(251 dumpProfile)
		(252 startProfiling)
		(253 stopProfiling)
		(254 primitiveFail)
		(255 primitiveFail)
	).