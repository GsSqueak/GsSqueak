accessing
morph

	^ morph ifNil: [
		self morph: self morphClass new.
		morph]