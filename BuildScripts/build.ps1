param (
    [string]$Action="default",
    [switch]$Help
)
$here = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if($Help){ 
  try {
    Get-Help "$($MyInvocation.MyCommand.Definition)" -full | Out-Host -paging
    Write-Host "Available build tasks:"
    psake -nologo -docs | Out-Host -paging
  } catch {}
  return
}

psake "$here/default.ps1" $Action