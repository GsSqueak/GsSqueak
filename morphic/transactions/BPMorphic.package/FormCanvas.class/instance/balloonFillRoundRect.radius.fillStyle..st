private
balloonFillRoundRect: aRectangle radius: radius fillStyle: fillStyle
  "^ self asBalloonCanvas
		fillRoundRect: aRectangle
		radius: radius
		fillStyle: fillStyle"

  ^ super fillRectangle: aRectangle fillStyle: fillStyle