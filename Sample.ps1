foreach ($item in $items)
{
      # if the item is a directory, then process it.
      if ($item.Attributes -eq "Directory")
      {
            $count = (git log --name-status -1 $item.Name | select-string -pattern $args[0]).length
            if($count -gt 1 -or $count -eq 1)
            {
                Write-Host $item.Name$count
            }
      }
}
