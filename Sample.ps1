#Get-ChildItem | ?{ $_.PSIsContainer } | Select-Object Name

#$arr = Get-ChildItem | Where-Object {$_.PSIsContainer} | Foreach-Object {$_.Name}

$items = Get-ChildItem
#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

foreach ($item in $items)
{
      # if the item is a directory, then process it.
      if ($item.Attributes -eq "Directory")
      {
            $count = (git log --name-status -1 $item.Name | select-string -pattern $args[0]).length
            if($count -gt 1 -or $count -eq 1)
            {
                New-Item -ItemType directory -Path Jenkins$item
                Write-Host $item$count
            }
            Write-Host $item$count
      }
}
