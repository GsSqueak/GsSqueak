class initialization
initializeLate
	"Called by GsSqueak bootstrap script after the Form class has been imported"
	| tempArray width |

	TextConstants at: #CaretForm put:
				(Form extent: 16@5
					fromArray: #(2r001100e26 2r001100e26 2r011110e26 2r111111e26 2r110011e26)
					offset: -3@0).
					
    TextConstants at: #DefaultRule	put: Form over
	TextConstants at: #DefaultMask	put: Color black.

