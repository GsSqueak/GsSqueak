converting
asPluggableAccessor: accessorArray 	^ (CPluggableAccessor on: object)		+= offset readBlock: accessorArray first writeBlock: accessorArray last