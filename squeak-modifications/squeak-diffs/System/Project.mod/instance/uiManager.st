accessing
uiManager
	"Answer the manager that provides user interface services for this project "
	^ uiManager
		ifNil: [uiManager := Smalltalk
						at: #UIManager
						ifPresent: [:mgr | uiManager := mgr getDefault]]