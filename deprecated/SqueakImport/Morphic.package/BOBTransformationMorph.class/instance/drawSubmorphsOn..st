drawing
drawSubmorphsOn: aCanvas

	| t | 
	t := [
		self drawSubmorphsOnREAL: aCanvas
	] timeToRun.
"Q1 at: 3 put: t."
