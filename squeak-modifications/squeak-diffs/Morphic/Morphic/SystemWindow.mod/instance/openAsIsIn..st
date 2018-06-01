open/close
openAsIsIn: aWorld
	"This msg and its callees result in the window being activeOnlyOnTop"
	aWorld addMorph: self.
	self beKeyWindow.
	aWorld startSteppingSubmorphsOf: self.