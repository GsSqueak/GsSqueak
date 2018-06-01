example
example
	"PluggableButtonMorph example openInWorld"

	| s1 s2 s3 b1 b2 b3 row switchClass |
	switchClass := Smalltalk at: #Switch ifAbsent: [^self inform: 'MVC class Switch not present'].
	s1 := switchClass new.
	s2 := switchClass new turnOn.
	s3 := switchClass new.
	s2 onAction: [s3 turnOff].
	s3 onAction: [s2 turnOff].
	b1 := (PluggableButtonMorph on: s1 getState: #isOn action: #switch) label: 'S1'.
	b2 := (PluggableButtonMorph on: s2 getState: #isOn action: #turnOn) label: 'S2'.
	b3 := (PluggableButtonMorph on: s3 getState: #isOn action: #turnOn) label: 'S3'.
	b1
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	b2
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	b3
		hResizing: #spaceFill;
		vResizing: #spaceFill.

	row := AlignmentMorph newRow
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		addAllMorphs: (Array with: b1 with: b2 with: b3);
		extent: 120@35.
	^ row
