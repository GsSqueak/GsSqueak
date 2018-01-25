testing
clampLow: lowMagnitude high: highMagnitude
"Answer my value, but keep it between lowMagnitude and highMagnitude"

	^ self min: highMagnitude max: lowMagnitude