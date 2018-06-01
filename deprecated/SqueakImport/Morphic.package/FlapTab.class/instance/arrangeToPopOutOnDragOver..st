mouseover & dragover
arrangeToPopOutOnDragOver: aBoolean
	aBoolean
		ifTrue:
			[self on: #mouseEnterDragging send: #showFlapIfHandLaden: to: self.
			referent on: #mouseLeaveDragging send: #maybeHideFlapOnMouseLeaveDragging to: self.
			self on: #mouseLeaveDragging send: #maybeHideFlapOnMouseLeaveDragging to: self]
		ifFalse:
			[self on: #mouseEnterDragging send: nil to: nil.
			referent on: #mouseLeaveDragging send: nil to: nil.
			self on: #mouseLeaveDragging send: nil to: nil]