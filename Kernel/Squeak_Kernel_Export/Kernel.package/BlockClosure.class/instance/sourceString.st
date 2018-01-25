printing
sourceString
	^ String streamContents: [ : stream | self printSourceOn: stream ]