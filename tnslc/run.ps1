if ($args.Length -gt 0) {
    ..\tint.exe -flags """$args""" -in tnslc.tnsl
    nasm -f win64 -o "$($args[0]).obj" "$($args[0]).asm"
    gcc -o "$($args[0]).exe" "$($args[0]).obj"
} else {
    Write-Host "Usage: run [file to compile]";
    Write-Host "";
}