private
nextSlotFor: shortDescription
	
	lock critical: [ | label bar slots |
		slots := self labels size.
		self activeSlots = slots ifTrue: [^0].
		self activeSlots: self activeSlots + 1.
		1 to: slots do: [:index |
			label := (self labels at: index).
			label ifNil: [
				bar := self bars at: index put: (SystemProgressBarMorph new extent: BarWidth@BarHeight).
				label := self labels at: index put: ((StringMorph contents: shortDescription font: self font) color: self textColor).
				self
					addMorphBack: label;
					addMorphBack: bar.
				^index].
			label owner ifNil: [
				bar := self bars at: index.
				label := self labels at: index.
				self
					addMorphBack: (label contents: shortDescription);
					addMorphBack: (bar barSize: 0).
				^index]]]
		