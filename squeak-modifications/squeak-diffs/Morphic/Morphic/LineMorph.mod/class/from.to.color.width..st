instance creation
from: startPoint to: endPoint color: lineColor width: lineWidth

	^ PolygonMorph vertices: {startPoint. endPoint}
			color: Color black borderWidth: lineWidth borderColor: lineColor