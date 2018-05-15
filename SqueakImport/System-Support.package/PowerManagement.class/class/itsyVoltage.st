computing
itsyVoltage
	"On the Itsy, answer the approximate Vcc voltage. The Itsy will shut 
	itself down when this value reaches 2.0 volts. This method allows one to 
	build a readout of the current battery condition."
	| n |
	n := Smalltalk getSystemAttribute: 1200.
	n
		ifNil: [^ 'no voltage attribute'].
	^ (n asNumber / 150.0 printShowingMaxDecimalPlaces: 2) , ' volts'