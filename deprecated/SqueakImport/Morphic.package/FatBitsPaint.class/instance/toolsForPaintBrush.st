initialization
toolsForPaintBrush

        ^Dictionary new
                at: #mouseMove: put: #mouseMovePaintBrushMode:;
                at: #mouseDown: put: #mouseDownDefault:;
                yourself