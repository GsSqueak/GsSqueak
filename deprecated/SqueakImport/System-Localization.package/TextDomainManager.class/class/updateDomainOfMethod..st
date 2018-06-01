private
updateDomainOfMethod: aCompiledMethod 
	"First it looks for the package of the method reference (using
	the PackageOrganizer: deadly slow). If the method doesn't
	belong to any package it uses the default domain. Finally it
	stores the text domain of the method using a method
	property, this way we gain performance the next time we
	translate the same method because we avoid the use of
	PackageOrganizer. Have I mentioned it is really slow? :)"
	| package |
	package := PackageOrganizer default
				packageOfMethod: aCompiledMethod methodReference
				ifNone: [].
	^ aCompiledMethod
		propertyValueAt: self textDomainProperty
		put: (package isNil
				ifTrue: [TextDomainManager defaultDomain]
				ifFalse: [package name])