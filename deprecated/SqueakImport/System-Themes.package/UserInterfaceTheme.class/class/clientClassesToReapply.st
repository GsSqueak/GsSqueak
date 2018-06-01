private
clientClassesToReapply
	"All client classes plus their unique subclasses."
	
	^ IdentitySet new in: [:result | self clientClasses do: [:cc | cc withAllSubclassesDo: [:sc |
		result add: sc]]. result]
