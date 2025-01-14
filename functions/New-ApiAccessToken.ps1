function New-ApiAccessToken {

	<#
	.SYNOPSIS
	Fetches the the API token.

	.DESCRIPTION
	Returns the API token.

	.INPUTS
	$apiUrl = The API URL
	$apiKey = The API Key
	$apiKeySecret = The API Secret Key

	.OUTPUTS
	API Token

	#>

	# Check API Parameters
	if (!$apiUrl -or !$apiKey -or !$apiSecretKey) {
		Write-Host "API Parameters missing, please run Set-DrmmApiParameters first!"
		return
	}

	# Specify security protocols
	# [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'
	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]'Tls11,Tls12'

	# Convert password to secure string
	$securePassword = ConvertTo-SecureString -String 'public' -AsPlainText -Force

	# Define parameters for Invoke-WebRequest cmdlet
	$params = @{
		Credential  = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ('public-client', $securePassword)
		Uri         = '{0}/auth/oauth/token' -f $apiUrl
		Method      = 'POST'
		ContentType = 'application/x-www-form-urlencoded'
		Body        = 'grant_type=password&username={0}&password={1}' -f $apiKey, $apiSecretKey
	}
	
	# Request access token
	try 
	{
		(Invoke-WebRequest -UseBasicParsing @params | ConvertFrom-Json).access_token

	}
	catch 
	{
		Write-Host $_.Exception.Message
	}

}