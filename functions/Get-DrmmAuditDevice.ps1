function Get-DrmmAuditDevice {

	<#
	.SYNOPSIS
	Fetches audit data of the generic device identified the given device Uid.

	.PARAMETER deviceUid
	Provide device uid which will be used to set the warranty field 
	
	#>
    
	# Function Parameters
    Param (
        [Parameter(Mandatory=$True)] 
        $deviceUid
    )

    # Declare Variables
    $apiMethod = 'GET'
    $Results = @()
	
	# Return device audit
	return $Response = New-ApiRequest -apiMethod $apiMethod -apiRequest "/v2/audit/device/$deviceUid" | ConvertFrom-Json

}