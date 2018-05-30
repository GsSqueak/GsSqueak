example
example
	"CustomMenu example"

	| menu |
	menu := CustomMenu new.
	menu add: 'apples' action: #apples.
	menu add: 'oranges' action: #oranges.
	menu addLine.
	menu addLine.  "extra lines ignored"
	menu add: 'peaches' action: #peaches.
	menu addLine.
	menu add: 'pears' action: #pears.
	menu addLine.
	^ menu startUp: #apples


"NB:  The following is equivalent to the above, but uses the compact #fromArray: consruct:
	(CustomMenu fromArray:
		#(	('apples'		apples)
			('oranges'		oranges)
			-
			-
			('peaches'		peaches)
			-
			('pears'			pears)
			-))
				startUp: #apples"