printing
storeOn: aStream
	"Note: We generate the same array as provided by the VM. BUT we are a subclass of MouseEvent now even if we cannot store the position right now. This is awkward. But we still store the position and the wheel delta. *sign*"
	
	super storeOn: aStream.
	aStream space.
	delta x storeOn: aStream.
	aStream space.
	delta y storeOn: aStream.
	aStream space.
	direction storeOn: aStream.
