example
example
	"PluggableButtonMorph example openInWorld"
	| _gsSqueakTemp_s1 _gsSqueakTemp_s2 _gsSqueakTemp_s3 _gsSqueakTemp_b1 _gsSqueakTemp_b2 _gsSqueakTemp_b3 _gsSqueakTemp_row _gsSqueakTemp_switchClass |
	_gsSqueakTemp_switchClass := Smalltalk
				at: #Switch
				ifAbsent: [^ self inform: 'MVC class Switch not present'].
	_gsSqueakTemp_s1 := _gsSqueakTemp_switchClass new.
	_gsSqueakTemp_s2 := _gsSqueakTemp_switchClass new turnOn.
	_gsSqueakTemp_s3 := _gsSqueakTemp_switchClass new.
	_gsSqueakTemp_s2
		onAction: [_gsSqueakTemp_s3 turnOff].
	_gsSqueakTemp_s3
		onAction: [_gsSqueakTemp_s2 turnOff].
	_gsSqueakTemp_b1 := (PluggableButtonMorph
				on: _gsSqueakTemp_s1
				getState: #isOn
				action: #switch)
				label: 'S1'.
	_gsSqueakTemp_b2 := (PluggableButtonMorph
				on: _gsSqueakTemp_s2
				getState: #isOn
				action: #turnOn)
				label: 'S2'.
	_gsSqueakTemp_b3 := (PluggableButtonMorph
				on: _gsSqueakTemp_s3
				getState: #isOn
				action: #turnOn)
				label: 'S3'.
	_gsSqueakTemp_b1 hResizing: #spaceFill;
		 vResizing: #spaceFill.
	_gsSqueakTemp_b2 hResizing: #spaceFill;
		 vResizing: #spaceFill.
	_gsSqueakTemp_b3 hResizing: #spaceFill;
		 vResizing: #spaceFill.
	_gsSqueakTemp_row := AlignmentMorph newRow hResizing: #spaceFill;
				 vResizing: #spaceFill;
				
				addAllMorphs: (Array
						with: _gsSqueakTemp_b1
						with: _gsSqueakTemp_b2
						with: _gsSqueakTemp_b3);
				 extent: 120 @ 35.
	^ _gsSqueakTemp_row