initialization
initialize
    "We are missing some font creation methods in GsSqueak due to thier length"
    StrikeFont installDejaVu.
    
    "GsSqueak needs the default text style to be set somewhere"
    DefaultTextStyle := TextConstants at: #'Bitmap DejaVu Sans' 
