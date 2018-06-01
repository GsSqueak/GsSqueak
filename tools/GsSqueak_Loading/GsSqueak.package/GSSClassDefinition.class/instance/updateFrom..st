saving
updateFrom: classProxy
	
	instanceMethods := self overlayMethods: self loadedInstanceMethods 
							with: (self methodsIn: classProxy theNonMetaClass).
	classMethods := self overlayMethods: self loadedClassMethods
						with: (self methodsIn: classProxy theMetaClass).
	self updatePropertiesFrom: classProxy.