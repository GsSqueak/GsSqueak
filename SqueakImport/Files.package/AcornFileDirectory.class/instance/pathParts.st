path access
pathParts
	"Return the path from the root of the file system to this directory as an 
	array of directory names.
	This version tries to cope with the RISC OS' strange filename formatting; 
	filesystem::discname/$/path/to/file
	where the $ needs to be considered part of the filingsystem-discname atom."
	| pathList |
	pathList := super pathParts.
	(pathList indexOf: '$') = 2
		ifTrue: ["if the second atom is root ($) then stick $ on the first atom 
				and drop the second. Yuck"
			^ pathList species
				streamContents: [:a | 
					a nextPut: (pathList at: 1), '/$'.
					3 to: pathList size do: [:i | a
								nextPut: (pathList at: i)]]].
	^ pathList