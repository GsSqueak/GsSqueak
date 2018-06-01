accessing
domainOfMethod: aCompiledMethod 
	^ aCompiledMethod
		propertyValueAt: self textDomainProperty
		ifAbsent: [self updateDomainOfMethod: aCompiledMethod] 