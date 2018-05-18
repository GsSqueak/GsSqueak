initialization
openNearMorph: aMorph 
	self
		openNear: aMorph boundsInWorld
		in: (aMorph world ifNil: [ self world ])