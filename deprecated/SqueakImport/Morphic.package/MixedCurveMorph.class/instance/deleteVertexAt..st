editing
deleteVertexAt: anIndex
			(slopeClamps :=
						slopeClamps
						copyReplaceFrom: anIndex
						to: anIndex
						with: Array new) .
			self
				setVertices: (vertices
						copyReplaceFrom: anIndex
						to: anIndex
						with: Array new).
						