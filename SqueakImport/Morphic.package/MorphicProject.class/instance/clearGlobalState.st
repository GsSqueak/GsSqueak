enter
clearGlobalState
	"Clean up global state. The global variables World, ActiveWorld, ActiveHand
	and ActiveEvent provide convenient access to the state of the active project
	in Morphic. Clear their prior values when leaving an active project. This
	method may be removed if the use of global state variables is eliminated."

	"If global World is defined, clear it now. The value is expected to be set
	again as a new project is entered."
	Smalltalk globals at: #World
		ifPresent: [ :w | Smalltalk globals at: #World put: nil ].
	ActiveWorld := ActiveHand := ActiveEvent := nil.
