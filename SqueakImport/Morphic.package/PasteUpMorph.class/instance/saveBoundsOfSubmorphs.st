viewing
saveBoundsOfSubmorphs
	"store the current xy-positions and extents of submorphs for future use"

	submorphs do:
		[:aSubmorph |
			aSubmorph setProperty: #savedExtent toValue: aSubmorph extent.
			aSubmorph setProperty: #savedPosition toValue: aSubmorph position]