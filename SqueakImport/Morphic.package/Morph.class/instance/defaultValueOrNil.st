e-toy support
defaultValueOrNil
	"If the receiver has a property named #defaultValue, return that property's value, else return nil"

	^ self valueOfProperty: #defaultValue ifAbsent: [nil]