#searches AD for users who are not enabled and removes their manager
#What are we doing here???  I can make this better and less code.  

foreach($user in (get-aduser -filter *)){
$account = get-aduser $user -Properties enabled, manager
if($account.enabled -eq $false -and $account.manager -ne $null){
Write-Output "Working on $($account.name)"
set-aduser $account -Manager $null
}
 }
