*SqClasses-*SqClasses-*SqClasses-vm statistics
vmStatisticsReportString
	"(Workspace new contents: Smalltalk vmStatisticsReportString)
		openLabel: 'VM Statistics'"
	"StringHolderView
		open: (StringHolder new contents: Smalltalk vmStatisticsReportString)
		label: 'VM Statistics'"

	| params oldSpaceEnd youngSpaceEnd memorySize fullGCs fullGCTime fullGCCompactionTime incrGCs incrGCTime tenureCount upTime
	  upTime2 fullGCs2 fullGCTime2  incrGCs2 incrGCTime2 tenureCount2 str freeSize youngSize used spur timeReporter idleMs idleMs2 codeCompactionTime codeCompactionsOrNil codeCompactionTime2 codeCompactions2 maxParams |
	"Pad to protect for a VM that does not answer the expected parameter array"
	maxParams := 63. "max position referenced in this method"
	params := Array streamContents: [ :strm |
				strm nextPutAll: Smalltalk getVMParameters.
				[strm position < maxParams] whileTrue: [strm nextPut: nil]].
	oldSpaceEnd			:= params at: 1.
	youngSpaceEnd		:= params at: 2.
	memorySize			:= params at: 3.
	fullGCs				:= params at: 7.
	fullGCTime			:= params at: 8.
	incrGCs				:= params at: 9.
	incrGCTime			:= params at: 10.
	tenureCount			:= params at: 11.
	fullGCCompactionTime	:= params at: 18.
	codeCompactionsOrNil	:= params at: 62.
	codeCompactionTime	:= params at: 63.
	
	upTime := (params at: 20) ~= 0 "utcMicrosecondClock at startup in later Spur VMs"
				ifTrue: [Time utcMicrosecondClock - (params at: 20) + 500 // 1000]
				ifFalse: [Time eventMillisecondClock]. "Fall back on old microsecond clock; Good for 47.5 days"
	spur := (params at: 41)
				ifNotNil: [ :p | p anyMask: 16]
				ifNil: [false].
		str := WriteStream on: (String new: 2048).
	timeReporter := [:time| | seconds |
					seconds := time / 1000.
					seconds >= (60*60*24)
						ifTrue:
							[str print: seconds / 60 // 60 // 24; nextPut: $d; space;
								print: seconds / 60 // 60 \\ 24; nextPut: $h; space]
						ifFalse:
							[seconds >= (60*60) ifTrue:
								[str print: (seconds / 60 // 60); nextPut: $h; space]].
					str
						print: (seconds / 60 \\ 60) asInteger; nextPut: $m; space;
						print: (seconds \\ 60) asInteger; nextPut: $s].
	str	nextPutAll: 'uptime		'.
	timeReporter value: upTime.
	(idleMs := params at: 16) ~= 0 ifTrue:
		[str tab; nextPutAll: '(runtime '.
		 idleMs := idleMs // 1000.
		 timeReporter value: upTime - idleMs.
		 str nextPutAll: ', idletime '.
		 timeReporter value: idleMs.
		 str nextPut: $)].
	str cr.

	str	nextPutAll: 'memory		';
		nextPutAll: memorySize asStringWithCommas; nextPutAll: ' bytes'; cr.
	str	nextPutAll:	'	old			';
		nextPutAll: oldSpaceEnd asStringWithCommas; nextPutAll: ' bytes (';
		print: oldSpaceEnd / memorySize * 100 maxDecimalPlaces: 1; nextPutAll: '%)'; cr.

	spur ifTrue:
		[(youngSize := (params at: 19)  * 7 // 5) = 0 ifTrue: [params at: 44].
		 youngSize := youngSize roundUpTo: 1024.
		 str	nextPutAll: '	young		';
			nextPutAll: youngSize asStringWithCommas; nextPutAll: ' bytes (';
			print: youngSize / memorySize * 100 maxDecimalPlaces: 1; nextPutAll: '%)'; cr.
		youngSize := youngSpaceEnd. "used eden"
		freeSize := (params at: 54) + (params at: 44) - youngSize.
		used := youngSize + oldSpaceEnd - freeSize.
		str	nextPutAll: '	used		';
			nextPutAll: used asStringWithCommas; nextPutAll: ' bytes (';
			print: used / memorySize * 100 maxDecimalPlaces: 1; nextPutAll: '%)'; cr.
		str	nextPutAll: '	free		';
			nextPutAll: freeSize asStringWithCommas; nextPutAll: ' bytes (';
			print: freeSize / memorySize * 100 maxDecimalPlaces: 1; nextPutAll: '%)'; cr]
		ifFalse: "Earlier VM and V3 object memory"
		[str	nextPutAll: '	young		';
			nextPutAll: (youngSpaceEnd - oldSpaceEnd) asStringWithCommas; nextPutAll: ' bytes (';
			print: (youngSpaceEnd - oldSpaceEnd / memorySize * 100) maxDecimalPlaces: 1; nextPutAll: '%)'; cr.
		str	nextPutAll: '	used		';
			nextPutAll: youngSpaceEnd asStringWithCommas; nextPutAll: ' bytes (';
			print: (youngSpaceEnd / memorySize * 100) maxDecimalPlaces: 1; nextPutAll: '%)'; cr.
		str	nextPutAll: '	free		';
			nextPutAll: (memorySize - youngSpaceEnd) asStringWithCommas; nextPutAll: ' bytes (';
			print: (memorySize - youngSpaceEnd / memorySize * 100) maxDecimalPlaces: 1; nextPutAll: '%)'; cr].

	str	nextPutAll: 'GCs			';
		nextPutAll: (fullGCs + incrGCs) asStringWithCommas.
	fullGCs + incrGCs > 0 ifTrue:
		[str
			nextPutAll: ' ('; 
			print: upTime / (fullGCs + incrGCs) maxDecimalPlaces: 1; 
			nextPutAll: ' ms between GCs'.
		 idleMs > 0 ifTrue:
			[str
				space;
				print: upTime - idleMs / (fullGCs + incrGCs) maxDecimalPlaces: 1; 
				nextPutAll: ' ms runtime between GCs'].
		 str nextPut: $)].
	str cr.
	str	nextPutAll: '	full		';
		nextPutAll: fullGCs asStringWithCommas; nextPutAll: ' totalling '; nextPutAll: fullGCTime asStringWithCommas; nextPutAll: ' ms (';
		print: fullGCTime / (upTime - idleMs) * 100 maxDecimalPlaces: 2;
		nextPutAll: '% runtime)';
		nextPutAll: ', avg '; print: (fullGCTime / (fullGCs max: 1)) maxDecimalPlaces: 1; nextPutAll: ' ms'.
	(spur and: [fullGCCompactionTime ~= 0]) ifTrue:
		[str	cr; nextPutAll: '				marking		';
			nextPutAll: (fullGCTime - fullGCCompactionTime) asStringWithCommas; nextPutAll: ' ms (';
			print: (fullGCTime - fullGCCompactionTime) / fullGCTime * 100 maxDecimalPlaces: 1;
			nextPutAll: '%) avg '; print: (fullGCTime - fullGCCompactionTime / (fullGCs max: 1)) maxDecimalPlaces: 1;
			nextPutAll: ' ms,'; cr;
			nextPutAll: '				compacting	';
			nextPutAll: fullGCCompactionTime asStringWithCommas; nextPutAll: ' ms (';
			print: fullGCCompactionTime / fullGCTime * 100 maxDecimalPlaces: 1;
			nextPutAll: '%) avg '; print: fullGCCompactionTime / (fullGCs max: 1) maxDecimalPlaces: 1;
			nextPutAll: ' ms'].
	str	cr.
	str	nextPutAll: (spur ifTrue: ['	scavenges	'] ifFalse: ['	incr			']);
		nextPutAll: incrGCs asStringWithCommas; nextPutAll: ' totalling '; nextPutAll: incrGCTime asStringWithCommas; nextPutAll: ' ms (';
		print: incrGCTime / (upTime - idleMs) * 100 maxDecimalPlaces: 2;
		nextPutAll: '% runtime), avg '; print: incrGCTime / incrGCs maxDecimalPlaces: 1; nextPutAll: ' ms'; cr.
	str	nextPutAll: '	tenures		';
		nextPutAll: tenureCount asStringWithCommas.
	tenureCount = 0 ifFalse:
		[spur
			ifTrue: [str nextPutAll: ' (avg '; print: tenureCount // (incrGCs max: 1); nextPutAll: ' tenures per scavenge)']
			ifFalse: [str nextPutAll: ' (avg '; print: incrGCs // tenureCount; nextPutAll: ' GCs/tenure)']].
	str	cr.

	codeCompactionsOrNil ifNotNil:
		[str
			nextPutAll: 'Code compactions	'; crtab.
		codeCompactionsOrNil = 0
			ifTrue: [str
				nextPutAll: codeCompactionsOrNil asString; cr]
			ifFalse: [str
				nextPutAll: codeCompactionsOrNil asStringWithCommas; nextPutAll: ' totalling '; nextPutAll: codeCompactionTime asStringWithCommas; nextPutAll: ' ms (';
				print: codeCompactionTime / (upTime - idleMs) * 100 maxDecimalPlaces: 3;
				nextPutAll: '% runtime), avg '; print: codeCompactionTime / codeCompactionsOrNil maxDecimalPlaces: 1; nextPutAll: ' ms'; cr]].

LastStats ifNil: [LastStats := Array new: 9]
ifNotNil: [
	LastStats size < 9 ifTrue:
		[LastStats := LastStats, (Array new: 9 - LastStats size withAll: 0)].
	upTime2 := upTime - (LastStats at: 1).
	fullGCs2 := fullGCs - (LastStats at: 2).
	fullGCTime2 := fullGCTime - (LastStats at: 3).
	incrGCs2 := incrGCs - (LastStats at: 4).
	incrGCTime2 := incrGCTime - (LastStats at: 5).
	tenureCount2 := tenureCount - (LastStats at: 6).
	idleMs2 := idleMs - (LastStats at: 7).
	codeCompactionsOrNil ifNotNil:
		[codeCompactions2	:= codeCompactionsOrNil - (LastStats at: 8).
		 codeCompactionTime2	:= codeCompactionTime - (LastStats at: 9)].

	str	nextPutAll: self textMarkerForShortReport ;
		nextPutAll: (fullGCs2 + incrGCs2) asStringWithCommas.
	fullGCs2 + incrGCs2 > 0 ifTrue:
		[str
			nextPutAll: ' ('; 
			print: upTime2 // (fullGCs2 + incrGCs2); 
			nextPutAll: ' ms between GCs'.
			idleMs2 > 0 ifTrue:
				[str
					nextPutAll: ', ';
					print: upTime2 - idleMs2 // (fullGCs2 + incrGCs2);
					nextPutAll: ' ms runtime between GCs'].
		 str nextPut: $)].
	str	cr.
	str	nextPutAll: '	uptime				'; print: (upTime2 / 1000.0) maxDecimalPlaces: 1;
		nextPutAll: ' s, runtime ';		   print: (upTime2 - idleMs2 / 1000.0) maxDecimalPlaces: 1;
		nextPutAll: ' s, idletime ';		   print: (idleMs2 / 1000.0) maxDecimalPlaces: 1; nextPutAll: ' s'; cr.
	str	nextPutAll: '	full					';
		nextPutAll: fullGCs2 asStringWithCommas.
	fullGCs2 + fullGCTime2 > 0 ifTrue:
		[str	nextPutAll: ' totalling '; nextPutAll: fullGCTime2 asStringWithCommas; nextPutAll: ' ms (';
			print: fullGCTime2 / (upTime2 - idleMs2) * 100 maxDecimalPlaces: 1;
			nextPutAll: '% runtime)'.
		 str	nextPutAll: ', avg '; print: fullGCTime2 / (fullGCs2 max: 1) maxDecimalPlaces: 1; nextPutAll: ' ms'].
	str	cr.
	str	nextPutAll: (spur ifTrue: ['	scavenge				'] ifFalse: ['	incr			']);
		nextPutAll: incrGCs2 asStringWithCommas; nextPutAll: ' totalling '; nextPutAll: incrGCTime2 asStringWithCommas; nextPutAll: ' ms (';
		print: incrGCTime2 / (upTime2 - idleMs2) * 100 maxDecimalPlaces: 1;
		nextPutAll: '% runtime), avg '; print: incrGCTime2 / (incrGCs2 max: 1) maxDecimalPlaces: 1; nextPutAll: ' ms'.
	str	cr.
	str	nextPutAll: '	tenures				';
		nextPutAll: tenureCount2 asStringWithCommas.
	tenureCount2 = 0 ifFalse:
		[spur
			ifTrue: [str nextPutAll: ' (avg '; print: tenureCount2 // (incrGCs2 max: 1); nextPutAll: ' tenures per scavenge)']
			ifFalse: [str nextPutAll: ' (avg '; print: incrGCs2 // tenureCount2; nextPutAll: ' GCs/tenure)']].
	str	cr.
	codeCompactionsOrNil ifNotNil:
		[str	nextPutAll: '	code compactions	';
			nextPutAll: codeCompactions2 asStringWithCommas; nextPutAll: ' totalling '; nextPutAll: codeCompactionTime2 asStringWithCommas; nextPutAll: ' ms (';
			print: codeCompactionTime2 / (upTime2 - idleMs2) * 100 maxDecimalPlaces: 3;
			nextPutAll: '% runtime)'.
		 codeCompactions2 > 0 ifTrue:
			[str nextPutAll: ', avg '; print: codeCompactionTime2 / codeCompactions2 maxDecimalPlaces: 1; nextPutAll: ' ms'; cr.]]
].
	LastStats := { upTime. fullGCs. fullGCTime. incrGCs. incrGCTime. tenureCount. idleMs. codeCompactionsOrNil. codeCompactionTime }.

	^str contents
