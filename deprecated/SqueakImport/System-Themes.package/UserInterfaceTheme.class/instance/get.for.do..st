private
get: propertySymbol for: scope do: block

	^ block cull: (self get: propertySymbol for: scope)