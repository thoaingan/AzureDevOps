param (
[Parameter(Mandatory=$true)]
[ValidateNotNullOrEmpty()]
[string] $VariableName
)


$uniqueName = Get-Date -format "yyyyMMddHHmmss"
$person = @{
    name= $uniqueName
    salary='123'
    age='37'
}
$json = $person | ConvertTo-Json
$response = Invoke-RestMethod 'http://dummy.restapiexample.com/api/v1/create' -Method Post -Body $json -ContentType 'application/json'

$id = $($response.id)

Write-Output $id

Write-Host ("##vso[task.setvariable variable=" + $VariableName + ";]" + $id)
