function Sign-Exe {
[CmdletBinding()]
param (
		
	[Parameter(Mandatory = $True)]
	[String]$CN,
	
	[Parameter(Mandatory = $True)]
	[String]$DnsName,
	
	[Parameter(Mandatory = $True)]
	[String]$OutCert,
	
	[Parameter(Mandatory = $True)]
	[String]$ExeToSign
	
)
	$Cert = New-SelfSignedCertificate -CertStoreLocation cert:\CurrentUser\my -DnsName $DnsName -Subject "CN=$CN" -Type CodeSigningCert
	
	Export-Certificate -Type CERT -FilePath $OutCert -Cert $Cert
	
	Import-Certificate -FilePath $OutCert -CertStoreLocation Cert:\CurrentUser\Root\
	
	Set-AuthenticodeSignature -Certificate $Cert -FilePath $ExeToSign
	
	Remove-Item $OutCert	
}
