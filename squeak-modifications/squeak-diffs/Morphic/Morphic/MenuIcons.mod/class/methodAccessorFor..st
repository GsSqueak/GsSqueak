import/export
methodAccessorFor: iconName
	"Template method for an icon accessor method"

	^ '
	^ Icons
		at: #{1}
		ifAbsentPut: [ self {1}Contents ]' format: {iconName}