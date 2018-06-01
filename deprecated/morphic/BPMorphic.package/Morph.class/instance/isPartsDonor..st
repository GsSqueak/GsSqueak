parts bin
isPartsDonor: aBoolean 
	"change the receiver's isPartDonor property"
	(extension isNil
			and: [aBoolean not])
		ifTrue: [^ self].
	self assureExtension isPartsDonor: aBoolean