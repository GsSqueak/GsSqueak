initialization
setMorphicView: aMorphicModel
	view := aMorphicModel.
	self modalView: view.
	view model: self.