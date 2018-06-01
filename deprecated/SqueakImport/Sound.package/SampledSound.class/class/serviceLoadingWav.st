file reader services
serviceLoadingWav

	^ SimpleServiceEntry 
		provider: self 
		label: 'load as sound'
		selector: #fromDroppedWaveFileNamed:
		description: 'load the sound'
		buttonLabel: 'load as sound'