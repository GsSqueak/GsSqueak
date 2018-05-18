private
step
	| ext |
	brevityState = #graphic ifTrue: [
		ext := self availableGraphicsExtent.
		ext = lastGraphicsExtent ifFalse: [
			lastGraphicsExtent := ext.
			brevityState := #needToGetGraphic.
			self changed: #contents]]