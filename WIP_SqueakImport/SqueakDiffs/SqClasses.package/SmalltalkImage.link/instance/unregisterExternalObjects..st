external objects
unregisterExternalObjects: aCollection
	"Unregister the given objects from the external objects array. Do nothing if they aren't registered."

	ExternalObjectTable current unregisterExternalObjects: aCollection
