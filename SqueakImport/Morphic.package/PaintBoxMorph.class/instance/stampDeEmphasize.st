actions
stampDeEmphasize
	"Turn off an emphasized stamp.  Was turned on in pickup:action:cursor:"

	tool owner class == AlignmentMorph ifTrue: [
		tool "actionButton" owner "layoutMorph" color: Color transparent; 
					borderColor: Color transparent].