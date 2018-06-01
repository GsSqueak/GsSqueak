private
drawGradient: fillColor 
	self comment: 'not-solid fill ' with: fillColor.
	self comment: ' origin ' with: fillColor origin.
	self comment: ' direction ' with: fillColor direction.
	self fill: fillColor asColor