if ($args.Length -gt 0) {
    ..\tint.exe -flags "$args" -in tnslc.tnsl
    mkdir -Force build
    mv -Force "$($args[0]).asm" "build/$($args[0]).asm"
    nasm -f win64 -o "build/$($args[0]).obj" "build/$($args[0]).asm"
    gcc -o "build/$($args[0]).exe" "build/$($args[0]).obj"
} else {
    Write-Host "Usage: run [file to compile]";
    Write-Host "";
}
