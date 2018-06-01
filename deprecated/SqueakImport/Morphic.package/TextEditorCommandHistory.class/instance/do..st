enumeration
do: block
	"Goes backward in history."
	
	((currentIndex min: commands size) to: 1 by: -1)
		do: [:i | block value: (commands at: i)].