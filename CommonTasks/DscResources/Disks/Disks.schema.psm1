Configuration Disks
{
    param
    (
        [Parameter(Mandatory)]
        [hashtable[]]
        $DiskLayout
    )

    Import-DscResource -ModuleName StorageDsc -ModuleVersion 4.8.0.0

    foreach ($disk in $DiskLayout.GetEnumerator()) {
        (Get-DscSplattedResource -ResourceName Disk -ExecutionName $disk.DiskId -Properties $disk -NoInvoke).Invoke($disk)
    }
}