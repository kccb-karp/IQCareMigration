@echo off

echo Uninstalling IQCare Service
net stop "IQCare Service"
%WINDIR%\Microsoft.NET\Framework\v4.0.30319\installutil /u %SystemDrive%\IQCareService\RemServer.Service.exe /LogToConsole=false
timeout /t 3
echo Unistalling IQCare Web App
%WINDIR%\System32\inetsrv\appcmd.exe delete app "Default Web Site/IQCare"
timeout /t 3
echo Renaming Folders
IF EXIST C:\IQCareServiceV1\ ( RENAME %SystemDrive%\IQCareService IQCareServiceV4 && timeout /t 1 && RENAME %SystemDrive%\IQCareServiceV1 IQCareService && timeout /t 1 && RENAME C:\inetpub\wwwroot\IQCare IQCareV4 && timeout /t 1 && RENAME C:\inetpub\wwwroot\IQCareV1 IQCare && timeout /t 1) ELSE ( RENAME %SystemDrive%\IQCareService IQCareServiceV1 && timeout /t 1 && RENAME %SystemDrive%\IQCareServiceV4 IQCareService && timeout /t 1 && RENAME C:\inetpub\wwwroot\IQCare IQCareV1 && timeout /t 1 && RENAME C:\inetpub\wwwroot\IQCareV4 IQCare)
timeout /t 3
echo Installing IQCare Web App
%WINDIR%\System32\inetsrv\appcmd add app /site.name:"Default Web Site" /path:/IQCare /physicalPath:C:\inetpub\wwwroot\IQCare
timeout /t 3
echo Installing IQCare Service
%WINDIR%\Microsoft.NET\Framework\v4.0.30319\installutil c:\IQCareService\RemServer.Service.exe /LogToConsole=false
net start "IQCare Service" 
timeout /t 3
CALL %SystemDrive%\IQCareService\Admin\IQCareServiceControl.exe
echo Success!
