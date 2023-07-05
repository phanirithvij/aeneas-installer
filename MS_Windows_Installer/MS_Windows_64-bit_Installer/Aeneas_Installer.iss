; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "aeneas tools"
#define MyAppVersion "1.7.3.0"
#define MyAppPublisher "Daniel Bair"
#define MyAppURL "https://github.com/sillsdev/aeneas-installer"
#define MyAppInstallDir "C:\aeneas-install"
#define MyAppFileName "aeneas-win64-setup-1.7.3.0_4"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{47679629-20DD-4D46-AE0C-D137DD0BF1FD}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion} (64-bit)
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
UsePreviousAppDir=yes
DefaultDirName={#MyAppInstallDir}
DisableDirPage=yes
DisableWelcomePage=no
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
DisableProgramGroupPage=yes
LicenseFile=LICENSE.txt
InfoBeforeFile=README.txt
OutputDir=.\
OutputBaseFilename={#MyAppFileName}
Compression=lzma
SolidCompression=yes
ChangesEnvironment=yes
;SignTool=sign_installer.sh

[Messages]
WelcomeLabel2=This will install aeneas 1.7.3.0 on your computer.%n%naeneas is a Python library and a set of tools for automated audio and text synchronization.%n%nIn addition to aeneas, the following independent programs necessary for running aeneas are contained in this installer:%n1. eSpeak-NG%n2. FFmpeg%n3. Python%n%nIt is recommended that you close all other applications before continuing.

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Components]
Name: "espeak"; Description: "Install eSpeak-NG 1.51"; ExtraDiskSpaceRequired: 11223040; Types: full custom
Name: "ffmpeg"; Description: "Install FFmpeg 6.0"; ExtraDiskSpaceRequired: 111181824; Types: full custom
Name: "python"; Description: "Install Python 3.9.13"; ExtraDiskSpaceRequired: 106450944; Types: full
Name: "bs4"; Description: "Install Python Module BeautifulSoup4 4.12.2"; ExtraDiskSpaceRequired: 3400000; Types: full compact custom
Name: "lxml"; Description: "Install Python Module lxml 4.9.2"; ExtraDiskSpaceRequired: 3548446; Types: full compact custom
Name: "numpy"; Description: "Install Python Module NumPy 1.25.0"; ExtraDiskSpaceRequired: 12971083; Types: full compact custom
Name: "aeneas"; Description: "Install Python Module aeneas 1.7.3.0"; ExtraDiskSpaceRequired: 4885092; Types: full compact custom
; NOTE: Previous used "Flags: fixed" on each component

[Files]
Source: "python-wheels\aeneas-1.7.3.0-cp39-cp39-win_amd64.whl"; DestDir: "{app}"; Components: aeneas; Flags: ignoreversion
Source: "python-wheels\numpy-1.25.0-cp39-cp39-win_amd64.whl"; DestDir: "{app}"; Components: numpy; Flags: ignoreversion
Source: "python-wheels\lxml-4.9.2-cp39-cp39-win_amd64.whl"; DestDir: "{app}"; Components: lxml; Flags: ignoreversion
Source: "python-wheels\beautifulsoup4-4.12.2-py3-none-any.whl"; DestDir: "{app}"; Components: bs4; Flags: ignoreversion
Source: "python-wheels\soupsieve-2.4.1-py3-none-any.whl"; DestDir: "{app}"; Components: bs4; Flags: ignoreversion
Source: "aeneas-win-installer-packages\python-3.9.13-amd64.exe"; DestDir: "{app}"; Components: python; Flags: ignoreversion
Source: "aeneas-win-installer-packages\ffmpeg-6.0-win64-static.exe"; DestDir: "{app}"; Components: ffmpeg; Flags: ignoreversion
Source: "aeneas-win-installer-packages\espeak-ng-1.51-x64.msi"; DestDir: "{app}"; Components: espeak; Flags: ignoreversion
Source: "copy_espeak_aeneas.bat"; DestDir: "{app}"; Components: aeneas; Flags: ignoreversion
Source: "delete_espeak_aeneas.bat"; DestDir: "{app}"; Components: aeneas; Flags: ignoreversion
Source: "aeneas_check_setup.bat"; DestDir: "{app}"; Components: aeneas; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Run]
Filename: "{sys}\MSIEXEC.EXE"; Parameters: "/PASSIVE /I {app}\espeak-ng-1.51-x64.msi"; StatusMsg: "Installing eSpeak-NG 1.51"; Components: espeak; Flags: shellexec waituntilterminated; AfterInstall: InstallerCopyFile('{commonpf64}\eSpeak NG\espeak-ng.exe','{commonpf64}\eSpeak NG\espeak.exe')
Filename: "{app}\ffmpeg-6.0-win64-static.exe"; Parameters: "/SILENT /ALLUSERS"; StatusMsg: "Installing FFmpeg 6.0"; Components: ffmpeg; Flags: shellexec waituntilterminated
Filename: "{app}\python-3.9.13-amd64.exe"; Parameters: "/PASSIVE InstallAllUsers=1 PrependPath=1 TargetDir=""{commonpf64}""\Python39"; StatusMsg: "Installing Python 3.9.13"; Components: python; Flags: shellexec waituntilterminated
Filename: "{commonpf64}\Python39\Scripts\pip.exe"; Parameters: "install -U {app}\numpy-1.25.0-cp39-cp39-win_amd64.whl"; StatusMsg: "Installing NumPy 1.25.0"; Components: numpy; Flags: runhidden waituntilterminated
Filename: "{commonpf64}\Python39\Scripts\pip.exe"; Parameters: "install -U {app}\lxml-4.9.2-cp39-cp39-win_amd64.whl"; StatusMsg: "Installing lxml 4.9.2"; Components: lxml; Flags: runhidden waituntilterminated
Filename: "{commonpf64}\Python39\Scripts\pip.exe"; Parameters: "install -U {app}\soupsieve-2.4.1-py3-none-any.whl"; StatusMsg: "Installing SoupSieve 2.4.1"; Components: bs4; Flags: runhidden waituntilterminated
Filename: "{commonpf64}\Python39\Scripts\pip.exe"; Parameters: "install -U {app}\beautifulsoup4-4.12.2-py3-none-any.whl"; StatusMsg: "Installing BeautifulSoup4 4.12.2"; Components: bs4; Flags: runhidden waituntilterminated
Filename: "{commonpf64}\Python39\Scripts\pip.exe"; Parameters: "install -U {app}\aeneas-1.7.3.0-cp39-cp39-win_amd64.whl"; StatusMsg: "Installing Aeneas 1.7.3.0"; Components: aeneas; Flags: runhidden waituntilterminated; BeforeInstall: InstallerCopyFile('{commonpf64}\eSpeak NG\libespeak-ng.dll','{commonpf64}\Python39\Lib\site-packages\aeneas\cew')
Filename: "{app}\copy_espeak_aeneas.bat"; StatusMsg: "Copying necessary eSpeak NG files for aeneas use"; Components: aeneas; Flags: runhidden waituntilterminated
Filename: "{app}\aeneas_check_setup.bat"; StatusMsg: "Running Aeneas_Check_Setup"; Components: aeneas; Flags: shellexec waituntilterminated

[UninstallRun]
Filename: "{app}\delete_espeak_aeneas.bat"; Components: aeneas; Flags: runhidden waituntilterminated
Filename: "{commonpf64}\Python39\Scripts\pip.exe"; Parameters: "uninstall -y aeneas beautifulsoup4 soupsieve lxml numpy"; Components: aeneas; Flags: runhidden waituntilterminated
Filename: "{app}\python-3.9.13-amd64.exe"; Parameters: "/PASSIVE /UNINSTALL "; Components: python; Flags: shellexec waituntilterminated; BeforeInstall: InstallerDeleteFile('{commonpf64}\Python39\Lib\site-packages\aeneas\cew\libespeak-ng.dll')
Filename: "{commonpf64}\FFmpeg\unins000.exe"; Parameters: "/SILENT"; Components: ffmpeg; Flags: shellexec waituntilterminated
Filename: "{sys}\MSIEXEC.EXE"; Parameters: "/PASSIVE /X {app}\espeak-ng-1.51-x64.msi"; Components: espeak; Flags: shellexec waituntilterminated; BeforeInstall: InstallerDeleteFile('{commonpf64}\eSpeak NG\espeak.exe')

[UninstallDelete]
;Type: filesandordirs; Name: "{commonpf64}\FFmpeg"; Components: ffmpeg
;Type: filesandordirs; Name: "{commonpf64}\Python39"; Components: espeak
;Type: filesandordirs; Name: "{commonpf64}\eSpeak NG"; Components: espeak
;Type: filesandordirs; Name: "{app}";

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{userappdata}\python\Python39\Scripts;{olddata}"; Components: aeneas; Check: NeedsAddPath('{userappdata}\python\Python39\Scripts')
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{commonpf64}\eSpeak NG;{olddata}"; Components: espeak; Check: NeedsAddPath('{commonpf64}\eSpeak NG')

[Code]
function NeedsAddPath(Param: string): boolean;
var OrigPath: string;
begin
  if not RegQueryStringValue(HKEY_LOCAL_MACHINE,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  // look for the path with leading and trailing semicolon
  // Pos() returns 0 if not found
  Result := Pos(';' + Param + ';', ';' + OrigPath + ';') = 0;
end;

procedure InstallerCopyFile(S: String; D: String);
begin
  Log('CopyFile(''' + S + ''', ''' + D + ''') called');
  if FileCopy(ExpandConstant(S),ExpandConstant(D), False)
  then
    Log('SUCCESS: Copied file ''' + S + ''' to ''' + D + '''.')
  else
    Log('ERROR: Failed to copy file ''' + S + ''' to ''' + D + '''!')
end;

procedure InstallerDeleteFile(S: String);
begin
  Log('DeleteFile(''' + S + ''') called')
  if DeleteFile(ExpandConstant(S))
  then
    Log('SUCCESS: Deleted file ''' + S + '''.')
  else
    Log('ERROR: Failed to delete file ''' + S + '''!')
end;
