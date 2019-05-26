# Basics

Install the module from PowerShell Gallery and enter your API keys:

```powershell
# Download and install the module
Install-Module DattoRMM

# Enter API Url and API keys
$apiUrl         	=	'<Datto RMM API Url>'
$apiKey         	=	'<Datto RMM API Key>'
$apiSecretKey   	=	'<Datto RMM API Secret Key>'

# Load DattoRMM Module
Import-Module DattoRMM -ArgumentList $apiUrl, $apiKey, $apiSecretKey 

```

# Datto RMM API

To create API keys goto https://help.aem.autotask.net/en/Content/2SETUP/APIv2.htm for more information.  
To see the REST API goto https://merlot-api.centrastage.net/api/swagger-ui.html#/ for more information.

# Release notes

## Version 1.0.0.5

- Added Get-DrmmAccountSite Function
- Added Get-DrmmSiteDevices Function
