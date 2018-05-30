<?php

$extensionFolders;
exec("find -name *.extension",$extensionFolders); 

$unmoved = array();

foreach($extensionFolders as $extension){
    $className = basename($extension,".extension");
    $classes = array();
    exec("find -name " . $className . ".mod", $classes);
    if(sizeof($classes) != 1){
        
        
        $newClasses = array();
        exec("find -name " . $className . ".new", $newClasses);
        exec("find -name " . $className . ".link", $newClasses);
        if(sizeof($newClasses) > 0){
            $unmoved[] =  $extension;
        }
        else{ //createClass
            exec("mkdir ExtensionClasses/" . $className . ".mod");
            exec("echo \"{name: '$className'}\" > ExtensionClasses/$className.mod/properties.json");
        }
            
        
    }
    else{
        echo "move" . $classes[0] . "\n";
        
        $instMethods = array();
        exec("find " . $extension . "/instance/ -name *.st",$instMethods); 
        
        exec("mkdir " . $classes[0] . "/instance/");
        foreach($instMethods as $instMethod){
            exec("mv -f " . $instMethod . " " . $classes[0] . "/instance/");
        }
        
        $classMethods = array();
        exec("find " . $extension . "/class/ -name *.st",$classMethods); 
        exec("mkdir " . $classes[0] . "/class/");
        foreach($classMethods as $classMethod){
            exec("mv -f " . $classMethod . " " . $classes[0] . "/class/");
        }
        
        
        
    }
}

var_dump($unmoved);
?>
