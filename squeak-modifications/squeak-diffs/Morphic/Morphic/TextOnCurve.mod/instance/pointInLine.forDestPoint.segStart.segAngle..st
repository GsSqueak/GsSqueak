private
pointInLine: line forDestPoint: p segStart: segStart segAngle: segAngle
	^ (p rotateBy: segAngle about: segStart)
			translateBy: (0@(line baseline + container baseline)) - segStart