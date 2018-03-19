-vivide
showFlashMini
	| _gsSqueakTemp_delay |
	_gsSqueakTemp_delay := Delay forMilliseconds: 50.
	5
		timesRepeat: [2
				timesRepeat: [Display
						fill: (self topLeft extent: 5 @ 5)
						rule: Form reverse
						fillColor: Color gray.
					_gsSqueakTemp_delay wait]]