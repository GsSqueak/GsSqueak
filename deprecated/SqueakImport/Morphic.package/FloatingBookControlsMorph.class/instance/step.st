stepping and presenter
step

	owner == self world ifFalse: [^ self].
	owner addMorphInLayer: self.
	self position: (owner bottomCenter) - ((self width//2)@self height)
