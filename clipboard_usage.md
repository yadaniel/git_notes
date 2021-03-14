# cygwin 
function ga() { 
    echo $GU > /dev/clipboard 
    sleep 3 
    echo $GP > /dev/clipboard 
    echo ... 
    echo > /dev/clipboard 
} 
 
# WPF 
function ga() { 
    echo $GU | clip.exe 
    sleep 3 
    echo $GP | clip.exe 
    echo ... 
    echo | clip.exe 
} 

