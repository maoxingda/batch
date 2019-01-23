function hello
{
    Param
    (
        $arg1,
        $arg2=3
    )

    Write-Host $args[0] $args[1]
    Write-Host $arg1 $arg2
}