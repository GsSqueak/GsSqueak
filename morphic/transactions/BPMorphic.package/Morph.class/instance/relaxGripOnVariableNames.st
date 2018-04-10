-Etoys-card in a stack
relaxGripOnVariableNames
	"Abandon any memory of specific variable names that should be
	preserved. The overall situation here is not yet completely
	understood, and this relaxation is basically always done on each
	reassessment of the background shape nowadays. But this doesn't
	feel quite right, because if the user has somehow intervened to
	specify certain name preference we should perhaps honored it. Or
	perhaps that is no longer relevant. ????"
	self submorphs
		do: [:m | 
			m removeProperty: #variableName.
			m removeProperty: #setterSelector].
	self reassessBackgroundShape