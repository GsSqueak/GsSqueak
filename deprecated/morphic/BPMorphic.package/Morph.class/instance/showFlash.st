-vivide
showFlash
	| _gsSqueakTemp_delay |
	_gsSqueakTemp_delay := Delay forMilliseconds: 50.
	5
		timesRepeat: [2
				timesRepeat: [Display
						border: self bounds
						width: 2
						rule: Form reverse
						fillColor: Color gray.
					_gsSqueakTemp_delay wait]]