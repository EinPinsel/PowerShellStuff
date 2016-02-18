function Move-ShittyJpg
{
    <#
        .SYNOPSIS
        Short Description
        .DESCRIPTION
        Detailed Description
        .EXAMPLE
        Move-ShittyJpeg
        explains how to use the command
        can be multiple lines
        .EXAMPLE
        Move-ShittyJpeg
        another example
        can have as many examples as you like
    #>
    Get-ChildItem *.jpg | % {if(Test-Path ($_.fullname.replace('.jpg','cr2'))) {Move-Item $_ .\halde\}}
}

