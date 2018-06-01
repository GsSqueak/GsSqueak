initialization history
initializePrimitiveTable19990421jm
	"From changes file of Squeak 2.4"
"!Interpreter class methodsFor: 'initialization' stamp: 'jm 4/10/1999 12:27'!
initializePrimitiveTable "
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
		(91 primitiveFail)					"Blue Book: primitiveCursorLocPut"
		(92 primitiveFail)					"Blue Book: primitiveCursorLink"
		(93 primitiveInputSemaphore)
		(94 primitiveFail)					"Blue Book: primitiveSampleInterval"
		(95 primitiveInputWord)
		(96 primitiveCopyBits)
		(97 primitiveSnapshot)
		(98 primitiveStoreImageSegment)
		(99 primitiveLoadImageSegment)
		(100 primitivePerformInSuperclass)		"Blue Book: primitiveSignalAtTick"
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
		(116 primitiveFlushCacheByMethod)
		(117 primitiveExternalCall)
		(118 primitiveDoPrimitiveWithArgs)
		(119 primitiveFlushCacheSelective)
			"Squeak 2.2 and earlier use 119.  Squeak 2.3 and later use 116.
			Both are supported for backward compatibility."

		"Miscellaneous Primitives (120-127)"
		(120 primitiveFail)
		(121 primitiveImageName)
		(122 primitiveNoop)					"Blue Book: primitiveImageVolume"
		(123 primitiveFail)
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
		(146 primitiveReadJoystick)
		(147 primitiveWarpBits)
		(148 primitiveClone)
		(149 primitiveGetAttribute)

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
		(163 primitiveDirectoryDelete)
		(164 168 primitiveFail)
		(169 primitiveDirectorySetMacTypeAndCreator)

		"Sound Primitives (170-199)"
		(170 primitiveSoundStart)
		(171 primitiveSoundStartWithSemaphore)
		(172 primitiveSoundStop)
		(173 primitiveSoundAvailableSpace)
		(174 primitiveSoundPlaySamples)
		(175 primitiveSoundPlaySilence)		"obsolete; will be removed in the future"
		(176 primWaveTableSoundmixSampleCountintostartingAtpan)
		(177 primFMSoundmixSampleCountintostartingAtpan)
		(178 primPluckedSoundmixSampleCountintostartingAtpan)
		(179 primSampledSoundmixSampleCountintostartingAtpan)
		(180 primFMSoundmixSampleCountintostartingAtleftVolrightVol)
		(181 primPluckedSoundmixSampleCountintostartingAtleftVolrightVol)
		(182 primSampledSoundmixSampleCountintostartingAtleftVolrightVol)
		(183 primReverbSoundapplyReverbTostartingAtcount)
		(184 primLoopedSampledSoundmixSampleCountintostartingAtleftVolrightVol)
		(185 188 primitiveFail)
		(189 primitiveSoundInsertSamples)
		(190 primitiveSoundStartRecording)
		(191 primitiveSoundStopRecording)
		(192 primitiveSoundGetRecordingSampleRate)
		(193 primitiveSoundRecordSamples)
		(194 primitiveSoundSetRecordLevel)
		(195 199 primitiveFail)

		"Networking Primitives (200-229)"
		(200 primitiveInitializeNetwork)
		(201 primitiveResolverStartNameLookup)
		(202 primitiveResolverNameLookupResult)
		(203 primitiveResolverStartAddressLookup)
		(204 primitiveResolverAddressLookupResult)
		(205 primitiveResolverAbortLookup)
		(206 primitiveResolverLocalAddress)
		(207 primitiveResolverStatus)
		(208 primitiveResolverError)
		(209 primitiveSocketCreate)
		(210 primitiveSocketDestroy)
		(211 primitiveSocketConnectionStatus)
		(212 primitiveSocketError)
		(213 primitiveSocketLocalAddress)
		(214 primitiveSocketLocalPort)
		(215 primitiveSocketRemoteAddress)
		(216 primitiveSocketRemotePort)
		(217 primitiveSocketConnectToPort)
		(218 primitiveSocketListenOnPort)
		(219 primitiveSocketCloseConnection)
		(220 primitiveSocketAbortConnection)
		(221 primitiveSocketReceiveDataBufCount)
		(222 primitiveSocketReceiveDataAvailable)
		(223 primitiveSocketSendDataBufCount)
		(224 primitiveSocketSendDone)
		(225 229 primitiveFail)

		"Other Primitives (230-249)"
		(230 primitiveRelinquishProcessor)
		(231 primitiveForceDisplayUpdate)
		(232 primitiveFormPrint)
		(233 primitiveSetFullScreen)
		(234 primBitmapdecompressfromByteArrayat)
		(235 primStringcomparewithcollated)
		(236 primSampledSoundconvert8bitSignedFromto16Bit)
		(237 primBitmapcompresstoByteArray)
		(238 primitiveSerialPortOpen)
		(239 primitiveSerialPortClose)
		(240 primitiveSerialPortWrite)
		(241 primitiveSerialPortRead)
		(242 primitiveFail)
		(243 primStringtranslatefromtotable)
		(244 primStringfindFirstInStringinSetstartingAt)
		(245 primStringindexOfAsciiinStringstartingAt)
		(246 primStringfindSubstringinstartingAtmatchTable)
		(247 249 primitiveFail)

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

		"MIDI Primitives (520-539)"
		(520 primitiveFail)
		(521 primitiveMIDIClosePort)
		(522 primitiveMIDIGetClock)
		(523 primitiveMIDIGetPortCount)
		(524 primitiveMIDIGetPortDirectionality)
		(525 primitiveMIDIGetPortName)
		(526 primitiveMIDIOpenPort)
		(527 primitiveMIDIParameterGetOrSet)
		(528 primitiveMIDIRead)
		(529 primitiveMIDIWrite)
		(530 539 primitiveFail)  "reserved for extended MIDI primitives"

		"Experimental Asynchrous File Primitives"
		(540 primitiveAsyncFileClose)
		(541 primitiveAsyncFileOpen)
		(542 primitiveAsyncFileReadResult)
		(543 primitiveAsyncFileReadStart)
		(544 primitiveAsyncFileWriteResult)
		(545 primitiveAsyncFileWriteStart)
		(546 547 primitiveFail)

		"Pen Tablet Primitives"
		(548 primitiveGetTabletParameters)
		(549 primitiveReadTablet)

		"Sound Codec Primitives"
		(550 primADPCMCodecprivateDecodeMono)	
		(551 primADPCMCodecprivateDecodeStereo)	
		(552 primADPCMCodecprivateEncodeMono)	
		(553 primADPCMCodecprivateEncodeStereo)	
		(554 569 primitiveFail)  "reserved for additional codec primitives"

		"Unassigned Primitives"
		(570 700 primitiveFail)).
