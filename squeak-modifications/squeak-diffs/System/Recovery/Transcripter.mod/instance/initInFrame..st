initialization
initInFrame: rect
	frame := rect insetBy: 2.  "Leave room for border"
	Project current initializeParagraphForTranscripter: self
