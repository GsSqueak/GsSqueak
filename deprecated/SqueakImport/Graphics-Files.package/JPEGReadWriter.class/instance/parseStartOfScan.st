marker parsing
parseStartOfScan

	| length n id value dcNum acNum comp |
	length := self nextWord.
	n := self next.
	(length ~= (n*2 + 6)) | (n < 1) ifTrue: [self error: 'SOS length is incorrect'].
	currentComponents := Array new: n.
	1 to: n do: [:i |
		id := self next.
		value := self next.
		dcNum := (value >> 4) bitAnd: 16r0F.
		acNum := value bitAnd: 16r0F.
		comp := components detect: [:c | c id = id].
		comp
			dcTableIndex: dcNum+1;
			acTableIndex: acNum+1.
		currentComponents at: i put: comp].
	ss := self next.
	se := self next.
	value := self next.
	ah := (value >> 4) bitAnd: 16r0F.
	al := value bitAnd: 16r0F.
	self initialSOSSetup.
	self perScanSetup.
	sosSeen := true