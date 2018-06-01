testing
tlsIsActive

	^ self connectionInfo at: #tlsActive ifAbsent: [false]