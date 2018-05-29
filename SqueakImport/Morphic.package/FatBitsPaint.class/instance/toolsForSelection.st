initialization
toolsForSelection

        ^ Dictionary new
                at: #mouseMove: put: #mouseMoveSelectionMode:;
                at: #mouseDown: put: #mouseDownSelection:;
                yourself