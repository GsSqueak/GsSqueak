examples
example1
	"EmphasizedMenu example1"

	^ (self
		selections: #('how' 'well' 'does' 'this' 'work?' ) 
		emphases: #(#bold #normal #italic #struckOut #normal ))
			startUpWithCaption: 'A Menu with Emphases'