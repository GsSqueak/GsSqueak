*files
asBytesDescription
	"Answer a terse, easily-readable representation of this Integer as a number of bytes.  Useful for file-browsers."
	| sign abs suffixes units |
	sign := self negative ifTrue: ['-'] ifFalse: [String empty].
	abs := self abs.
	suffixes := { '' "bytes".  'k'"ilobytes". 'M'"egabytes". 'G'"igabytes". 'T'"erabytes". 'P'"etabytes". 'E'"xabytes". 'Z'"ettabytes". 'Y'"ottabytes"}.
	1 to: suffixes size do:
		[ : index |
		units := 1000 raisedTo: index.
		units>abs ifTrue: [ ^ sign,(abs/(units/1000)) rounded asString,(suffixes at: index) ] ].
	^ sign,(abs/units) rounded,'Y'