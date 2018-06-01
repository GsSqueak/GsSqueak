-Etoys-support
buttonProperties: propertiesOrNil 
	propertiesOrNil
		ifNil: [self removeProperty: #universalButtonProperties]
		ifNotNil: [self setProperty: #universalButtonProperties toValue: propertiesOrNil]