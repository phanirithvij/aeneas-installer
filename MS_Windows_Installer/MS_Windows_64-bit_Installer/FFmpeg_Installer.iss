; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "FFmpeg"
#define MyAppVersion "6.0"
#define MyAppPublisher "Daniel Bair"
#define MyAppURL "https://github.com/sillsdev/aeneas-installer"
#define MyAppExeName "ff-prompt.bat"
#define MyAppFileName "ffmpeg-6.0-win64-static"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{F3EDA0E9-6DA3-4B46-818E-0C07AB675A8A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion} (64-bit)
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
UsePreviousAppDir=no
DefaultDirName={commonpf64}\{#MyAppName}
DisableDirPage=yes
DisableWelcomePage=no
DefaultGroupName={#MyAppName}
AllowNoIcons=no
DisableProgramGroupPage=no
LicenseFile={#MyAppFileName}\LICENSE
InfoBeforeFile={#MyAppFileName}\README.txt
OutputDir=.\
OutputBaseFilename={#MyAppFileName}
Compression=lzma
SolidCompression=yes
ChangesEnvironment=yes
;SignTool=sign_installer.sh

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "{#MyAppFileName}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\doc\ffmpeg.html"; Description: "View the documentation"; Flags: postinstall shellexec skipifsilent unchecked

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{commonpf64}\FFmpeg\bin;{olddata}"; Check: NeedsAddPath(ExpandConstant('{commonpf64}\FFmpeg\bin'))

[Code]
function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
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
