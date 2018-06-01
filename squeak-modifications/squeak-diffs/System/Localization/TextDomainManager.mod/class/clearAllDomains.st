private
clearAllDomains
	"TextDomainManager clearAllDomains"
	self systemNavigation allBehaviorsDo:
		[:b|
		b selectorsAndMethodsDo:
			[:s :m |
			m removeProperty: self textDomainProperty ifAbsent: []]]