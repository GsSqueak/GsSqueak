private
borderOffset
	|width|
	width :=SystemWindow borderWidth +1.
	 ^self handleOrigin + width asPoint