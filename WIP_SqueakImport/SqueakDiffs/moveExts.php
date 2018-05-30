<?php

$extensionFolders;
exec("find -name *.extension",$extensionFolders); 


foreach($extensionFolders as $extension){
    $className = basename($extension,".extension");
    $classes = array();
    exec("find -name " . $className . ".mod", $classes);
    if(sizeof($classes) != 1){
        echo $extension . " not moved\n";
    }
    else{
        echo "move" . $classes[0] . "\n";
        
        $instMethods = array();
        $classMethods = array();
        exec("find " . $extension . "/instance/ -name *.st",$instMethods); 
        exec("find " . $extension . "/class/ -name *.st",$classMethods); 
        
        
    }
    return;
}



?>
