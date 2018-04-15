function prompt {
    $origLastExitCode = $LastExitCode

    Write-Host "$env:COMPUTERNAME" -NoNewline -ForegroundColor DarkYellow
    Write-Host " in " -NoNewline -ForegroundColor White

    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.ToLower().StartsWith($Home.ToLower()))
    {
        $curPath = "~" + $curPath.SubString($Home.Length)
    } 

    Write-Host $curPath -NoNewline -ForegroundColor Blue

    Write-VcsStatus

    $LASTEXITCODE = $origLastExitCode
    "$('>' * ($nestedPromptLevel + 1)) "
}



Import-Module posh-git
Import-Module Get-ChildItemColor

Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

$global:GitPromptSettings.BeforeText = ' on ['
