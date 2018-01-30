preferences
subPixelRenderColorFonts
	<preference: 'Subpixel font rendering for color fonts' category: 'Graphics' description: 'If true, non-black opaque fonts are rendered using subpixel combination rules by BitBlt. Subpixel font rendering has to be enabled to take effect.' type: #Boolean>
	^ SubPixelRenderColorFonts
		ifNil: [true]