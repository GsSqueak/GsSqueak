initialization
initialize
	"initialize the state of the receiver"
	| displayer dataMorph |
	super initialize.
	""
	hasFocus := true.
	currentKeyDown := Set new.
	upDownCodes := Dictionary new.
	upDownCodes at: 126 put: #up;
		 at: 125 put: #down;
		 at: 123 put: #out;
		 at: 124 put: #in.
	"arrow keys on the mac"
	self extent: 40 @ 40;
		 vResizing: #rigid;
		 hResizing: #spaceFill;
		 setBalloonText: 'Drag in here to zoom, tilt and pan the page above'.
	dataMorph := AlignmentMorph newColumn.
	dataMorph color: Color yellow;
		 hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap.
	dataMorph
		on: #mouseDown
		send: #grabCameraPositionEvent:morph:
		to: self.
	displayer := UpdatingStringMorph new getSelector: #cameraPointRounded;
				 target: self;
				 growable: true;
				 putSelector: nil.
	dataMorph addMorph: displayer lock.
	displayer := UpdatingStringMorph new getSelector: #cameraScale;
				 target: self;
				 growable: true;
				 floatPrecision: 0.001;
				 putSelector: nil.
	dataMorph addMorph: displayer lock.
	self addMorph: dataMorph