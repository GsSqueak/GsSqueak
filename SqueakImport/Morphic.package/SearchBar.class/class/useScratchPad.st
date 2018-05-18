preferences
useScratchPad
	<preference: 'Ctrl+0 invokes the scratch pad'
		category: 'docking bars'
		description: 'When enabled, pressing Ctrl+0 will go straight to the Search Bar''s scratch pad instead of the Search Bar, where pressing ESCape will return keyboard focus to the originating window.'
		type: #Boolean>
	^ UseScratchPad ifNil: [ false ]