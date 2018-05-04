primitive table
updatePrimitiveTable
	"Make any run time updates to the primitive table that may be required for supporting
	the current running image. May be called by an interpreter that determines at run time
	that it needs to provide support for an older image.

	References: The SqueakJS dispatch table, which is known to run the full range of Squeak
	images, is used as a reference, along with comparison to the Squeak VM table as of
	January 2005 from VMMaker-tpr.22, which was the last version prior to converting
	images to support full closures  (dtl Dec 2016)"

	| primitiveTableUpdated |
	<inline: false>
	<var: #primitiveTableUpdated type: 'static int'>
	primitiveTableUpdated == true ifFalse: [
		primitiveTableUpdated := true.
		self useOldPrimitives ifTrue: [
			self installPrimitive: #primitiveNext at: 65.
			self installPrimitive: #primitiveNextPut at: 66.
			self installPrimitive: #primitiveAtEnd at: 67.

			self installPrimitive: #primitiveBlockCopy at: 80.
			self installPrimitive: #primitiveValue at: 81.
			self installPrimitive: #primitiveValueWithArgs at: 82.

			self installPrimitive: 'primitiveCopyBits' from: 'BitBltPlugin' at: 96.

			self installPrimitive: #primitiveValueUninterruptably at: 123.

			self installPrimitive: 'primitiveReadJoystick' from: 'JoystickTabletPlugin' at: 146.

			self installPrimitive: 'primitiveWarpBits' from: 'BitBltPlugin' at: 147.

			self installPrimitive: 'primitiveFileAtEnd' from: 'FilePlugin' at: 150.
			self installPrimitive: 'primitiveFileClose' from: 'FilePlugin'  at: 151.
			self installPrimitive: 'primitiveFileGetPosition' from: 'FilePlugin' at: 152.
			self installPrimitive: 'primitiveFileOpen' from: 'FilePlugin' at: 153.
			self installPrimitive: 'primitiveFileRead' from: 'FilePlugin' at: 154.
			self installPrimitive: 'primitiveFileSetPosition' from: 'FilePlugin' at: 155.
			self installPrimitive: 'primitiveFileDelete' from: 'FilePlugin' at: 156.
			self installPrimitive: 'primitiveFileSize' from: 'FilePlugin' at: 157.
			self installPrimitive: 'primitiveFileWrite' from: 'FilePlugin' at: 158.
			self installPrimitive: 'primitiveFileRename' from: 'FilePlugin' at: 159.
			self installPrimitive: 'primitiveDirectoryCreate' from: 'FilePlugin' at: 160.
			self installPrimitive: 'primitiveDirectoryDelimitor' from: 'FilePlugin'at: 161.
			self installPrimitive: 'primitiveDirectoryLookup' from: 'FilePlugin' at: 162.
			self installPrimitive: 'primitiveDirectoryDelete' from: 'FilePlugin' at: 163.
			self installPrimitive: 'primitiveDirectorySetMacTypeAndCreator' from: 'FilePlugin' at: 169.

			self installPrimitive: 'primitiveSoundStart' from: 'SoundPlugin' at: 170.
			self installPrimitive: 'primitiveSoundStartWithSemaphore' from: 'SoundPlugin' at: 171.
			self installPrimitive: 'primitiveSoundStop' from: 'SoundPlugin' at: 172.
			self installPrimitive: 'primitiveSoundAvailableSpace' from: 'SoundPlugin' at: 173.
			self installPrimitive: 'primitiveSoundPlaySamples' from: 'SoundPlugin' at: 174.
			self installPrimitive: 'primitiveSoundPlaySilence' from: 'SoundPlugin' at: 175.
			self installPrimitive: 'primWaveTableSoundmixSampleCountintostartingAtpan' from: 'SoundGenerationPlugin' at: 176.
			self installPrimitive: 'primFMSoundmixSampleCountintostartingAtpan' from: 'SoundGenerationPlugin' at: 177.
			self installPrimitive: 'primPluckedSoundmixSampleCountintostartingAtpan' from: 'SoundGenerationPlugin' at: 178.
			self installPrimitive: 'primSampledSoundmixSampleCountintostartingAtpan' from: 'SoundGenerationPlugin' at: 179.
			self installPrimitive: 'primitiveMixFMSound' from: 'SoundGenerationPlugin' at: 180.
			self installPrimitive: 'primitiveMixPluckedSound' from: 'SoundGenerationPlugin' at: 181.
			self installPrimitive: 'oldprimSampledSoundmixSampleCountintostartingAtleftVolrightVol' from: 'SoundGenerationPlugin' at: 182.
			self installPrimitive: 'primitiveApplyReverb' from: 'SoundGenerationPlugin' at: 183.
			self installPrimitive: 'primitiveMixLoopedSampledSound' from: 'SoundGenerationPlugin' at: 184.
			self installPrimitive: 'primitiveMixSampledSound' from: 'SoundGenerationPlugin' at: 185.

			self installPrimitive: 'primitiveSoundInsertSamples' from: 'SoundPlugin' at: 189.

			self installPrimitive: 'primitiveSoundStopRecording' from: 'SoundPlugin' at: 191.
			self installPrimitive: 'primitiveSoundGetRecordingSampleRate' from: 'SoundPlugin' at: 192.
			self installPrimitive: 'primitiveSoundRecordSamples' from: 'SoundPlugin' at: 193.
			self installPrimitive: 'primitiveSoundSetRecordLevel' from: 'SoundPlugin' at: 194.

			self installPrimitive: 'primitiveInitializeNetwork' from: 'SocketPlugin' at: 200.
			self installPrimitive: 'primitiveResolverStartNameLookup' from: 'SocketPlugin' at: 201.
			self installPrimitive: 'primitiveResolverNameLookupResult' from: 'SocketPlugin' at: 202.
			self installPrimitive: 'primitiveResolverStartAddressLookup' from: 'SocketPlugin' at: 203.
			self installPrimitive: 'primitiveResolverAddressLookupResult' from: 'SocketPlugin' at: 204.
			self installPrimitive: 'primitiveResolverAbortLookup' from: 'SocketPlugin' at: 205.
			self installPrimitive: 'primitiveResolverLocalAddress' from: 'SocketPlugin' at: 206.
			self installPrimitive: 'primitiveResolverStatus' from: 'SocketPlugin' at: 207.
			self installPrimitive: 'primitiveResolverError' from: 'SocketPlugin' at: 208.
			self installPrimitive: 'primitiveSocketCreate' from: 'SocketPlugin' at: 209.
			self installPrimitive: 'primitiveSocketDestroy' from: 'SocketPlugin' at: 210.
			self installPrimitive: 'primitiveSocketConnectionStatus' from: 'SocketPlugin' at: 211.
			self installPrimitive: 'primitiveSocketError' from: 'SocketPlugin' at: 212.
			self installPrimitive: 'primitiveSocketLocalAddress' from: 'SocketPlugin' at: 213.
			self installPrimitive: 'primitiveSocketLocalPort' from: 'SocketPlugin' at: 214.
			self installPrimitive: 'primitiveSocketRemoteAddress' from: 'SocketPlugin' at: 215.
			self installPrimitive: 'primitiveSocketRemotePort' from: 'SocketPlugin' at: 216.
			self installPrimitive: 'primitiveSocketConnectToPort' from: 'SocketPlugin' at: 217.
			self installPrimitive: 'primitiveSocketListenOnPort' from: 'SocketPlugin' at: 218.
			self installPrimitive: 'primitiveSocketCloseConnection' from: 'SocketPlugin' at: 219.
			self installPrimitive: 'primitiveSocketAbortConnection' from: 'SocketPlugin' at: 220.
			self installPrimitive: 'primitiveSocketReceiveDataBufCount' from: 'SocketPlugin' at: 221.
			self installPrimitive: 'primitiveSocketReceiveDataAvailable' from: 'SocketPlugin' at: 222.
			self installPrimitive: 'primitiveSocketSendDataBufCount' from: 'SocketPlugin' at: 223.
			self installPrimitive: 'primitiveSocketSendDone' from: 'SocketPlugin' at: 224.

			self installPrimitive: 'primitiveDecompressFromByteArray' from: 'MiscPrimitivePlugin' at: 234.
			self installPrimitive: 'primitiveCompareString' from: 'MiscPrimitivePlugin' at: 235.
			self installPrimitive: 'primitiveConvert8BitSigned' from: 'MiscPrimitivePlugin' at: 236.
			self installPrimitive: 'primitiveCompressToByteArray' from: 'MiscPrimitivePlugin' at: 237.

			self installPrimitive: 'primitiveSerialPortOpen' from: 'SerialPlugin' at: 238.
			self installPrimitive: 'primitiveSerialPortClose' from: 'SerialPlugin' at: 239.
			self installPrimitive: 'primitiveSerialPortWrite' from: 'SerialPlugin' at: 240.
			self installPrimitive: 'primitiveSerialPortRead' from: 'SerialPlugin' at: 241.

			self installPrimitive: 'primitiveTranslateStringWithTable' from: 'MiscPrimitivePlugin' at: 243.
			self installPrimitive: 'primitiveFindFirstInString' from: 'MiscPrimitivePlugin' at: 244.
			self installPrimitive: 'primitiveIndexOfAsciiInString' from: 'MiscPrimitivePlugin' at: 245.
			self installPrimitive: 'primitiveFindSubstring' from: 'MiscPrimitivePlugin' at: 246.
		]
	]
