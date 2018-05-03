initialization history
initializePrimitiveTable20040211tpr
	"This table generates a C switch statement for primitive dispatching."

	"NOTE: The real limit here is 2047, but our C compiler currently barfs over 700"
	MaxPrimitiveIndex _ 700.
	PrimitiveTable _ Array new: MaxPrimitiveIndex + 1.
	self table: PrimitiveTable from: 
	#(	"Integer Primitives (0-19)"
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
		(19 primitiveFail)					"Guard primitive for simulation -- *must* fail"

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
		(55 primitiveSquareRoot)
		(56 primitiveSine)
		(57 primitiveArctan)
		(58 primitiveLogN)
		(59 primitiveExp)

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
		(72 primitiveArrayBecomeOneWay)	"Blue Book: primitiveBecome"
		(73 primitiveInstVarAt)
		(74 primitiveInstVarAtPut)
		(75 primitiveAsOop)
		(76 primitiveStoreStackp)					"Blue Book: primitiveAsObject"
		(77 primitiveSomeInstance)
		(78 primitiveNextInstance)
		(79 primitiveNewMethod)

		"Control Primitives (80-89)"
		(80 primitiveBlockCopy)
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
		(91 primitiveTestDisplayDepth)			"Blue Book: primitiveCursorLocPut"
		(92 primitiveSetDisplayMode)				"Blue Book: primitiveCursorLink"
		(93 primitiveInputSemaphore)
		(94 primitiveGetNextEvent)				"Blue Book: primitiveSampleInterval"
		(95 primitiveInputWord)
		(96 primitiveObsoleteIndexedPrimitive)	"primitiveCopyBits"
		(97 primitiveSnapshot)
		(98 primitiveStoreImageSegment)
		(99 primitiveLoadImageSegment)
		(100 primitivePerformInSuperclass)		"Blue Book: primitiveSignalAtTick"
		(101 primitiveBeCursor)
		(102 primitiveBeDisplay)
		(103 primitiveScanCharacters)
		(104 primitiveObsoleteIndexedPrimitive)	"primitiveDrawLoop"
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
		(115 primitiveChangeClass)					"Blue Book: primitiveOopsLeft"
		(116 primitiveFlushCacheByMethod)
		(117 primitiveExternalCall)
		(118 primitiveDoPrimitiveWithArgs)
		(119 primitiveFlushCacheSelective)
			"Squeak 2.2 and earlier use 119.  Squeak 2.3 and later use 116.
			Both are supported for backward compatibility."

		"Miscellaneous Primitives (120-127)"
		(120 primitiveCalloutToFFI)
		(121 primitiveImageName)
		(122 primitiveNoop)					"Blue Book: primitiveImageVolume"
		(123 primitiveValueUninterruptably)	"@@@: Remove this when all VMs have support"
		(124 primitiveLowSpaceSemaphore)
		(125 primitiveSignalAtBytesLeft)

		"Squeak Primitives Start Here"

		"Squeak Miscellaneous Primitives (128-149)"
		(126 primitiveDeferDisplayUpdates)
		(127 primitiveShowDisplayRect)
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
		"NOTE: When removing the obsolete indexed primitives,
		the following two should go become #primitiveIntegerAt / atPut"
		(146 primitiveObsoleteIndexedPrimitive)	"primitiveReadJoystick"
		(147 primitiveObsoleteIndexedPrimitive)	"primitiveWarpBits"
		(148 primitiveClone)
		(149 primitiveGetAttribute)

		"File Primitives (150-169) - NO LONGER INDEXED"
		(150 164 primitiveObsoleteIndexedPrimitive)
		(165 primitiveIntegerAt)		"hacked in here for now"
		(166 primitiveIntegerAtPut)
		(167 primitiveYield)
		(168 primitiveCopyObject)
		(169 primitiveObsoleteIndexedPrimitive)

		"Sound Primitives (170-199) - NO LONGER INDEXED"
		(170 185 primitiveObsoleteIndexedPrimitive)

		"Closure primitives"
		(186 primitiveClosureValue)
		(187 primitiveClosureValueWithArgs)
		(188 primitiveExecuteMethod)

		"Sound Primitives (continued) - NO LONGER INDEXED"
		(189 194 primitiveObsoleteIndexedPrimitive)

		"Unwind primitives"
		(195 primitiveFindNextUnwindContext)
		(196 primitiveTerminateTo)
		(197 primitiveFindHandlerContext)
		(198 primitiveMarkUnwindMethod)
		(199 primitiveMarkHandlerMethod)

		"Networking Primitives (200-229) - NO LONGER INDEXED"
		(200 225 primitiveObsoleteIndexedPrimitive)
		(226 229 primitiveFail)

		"Other Primitives (230-249)"
		(230 primitiveRelinquishProcessor)
		(231 primitiveForceDisplayUpdate)
		(232 primitiveFormPrint)
		(233 primitiveSetFullScreen)
		(234 primitiveObsoleteIndexedPrimitive) "primBitmapdecompressfromByteArrayat"
		(235 primitiveObsoleteIndexedPrimitive) "primStringcomparewithcollated"
		(236 primitiveObsoleteIndexedPrimitive) "primSampledSoundconvert8bitSignedFromto16Bit"
		(237 primitiveObsoleteIndexedPrimitive) "primBitmapcompresstoByteArray"
		(238 241 primitiveObsoleteIndexedPrimitive) "serial port primitives"
		(242 primitiveFail)
		(243 primitiveObsoleteIndexedPrimitive) "primStringtranslatefromtotable"
		(244 primitiveObsoleteIndexedPrimitive) "primStringfindFirstInStringinSetstartingAt"
		(245 primitiveObsoleteIndexedPrimitive) "primStringindexOfAsciiinStringstartingAt"
		(246 primitiveObsoleteIndexedPrimitive) "primStringfindSubstringinstartingAtmatchTable"
		(247 primitiveSnapshotEmbedded)
		(248 primitiveInvokeObjectAsMethod)
		(249 primitiveArrayBecomeOneWayCopyHash)

		"VM Implementor Primitives (250-255)"
		(250 clearProfile)
		(251 dumpProfile)
		(252 startProfiling)
		(253 stopProfiling)
		(254 primitiveVMParameter)
		(255 primitiveInstVarsPutFromStack) "Never used except in Disney tests.  Remove after 2.3 release."

		"Quick Push Const Methods"
		(256 primitivePushSelf)
		(257 primitivePushTrue)
		(258 primitivePushFalse)
		(259 primitivePushNil)
		(260 primitivePushMinusOne)
		(261 primitivePushZero)
		(262 primitivePushOne)
		(263 primitivePushTwo)

		"Quick Push Const Methods"
		(264 519 primitiveLoadInstVar)

		"MIDI Primitives (520-539) - NO LONGER INDEXED"
		(520 529 primitiveObsoleteIndexedPrimitive)
		(530 539 primitiveFail)  "reserved for extended MIDI primitives"

		"Experimental Asynchrous File Primitives - NO LONGER INDEXED"
		(540 545 primitiveObsoleteIndexedPrimitive)
		(546 547 primitiveFail)

		"Pen Tablet Primitives - NO LONGER INDEXED"
		(548 primitiveObsoleteIndexedPrimitive)
		(549 primitiveObsoleteIndexedPrimitive)

		"Sound Codec Primitives - NO LONGER INDEXED"
		(550 553 primitiveObsoleteIndexedPrimitive)
		(554 569 primitiveFail)

		"External primitive support primitives"
		(570 primitiveFlushExternalPrimitives)
		(571 primitiveUnloadModule)
		(572 primitiveListBuiltinModule)
		(573 primitiveListExternalModule)
		(574 primitiveFail) "reserved for addl. external support prims"

		"Unassigned Primitives"
		(575 700 primitiveFail)).
