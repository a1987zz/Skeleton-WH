#Include classMemory.ahk

setbatchlines -1
Process, Wait, csgo.exe
 
csgo := new _ClassMemory("ahk_exe csgo.exe", "", hProcess)
if !IsObject(csgo)
{
if (hProcess = "")
msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
msgbox A_LastError %A_LastError%
ExitApp
}

Pattern := ["0x85", "0xC0", "??", "??", 0xFF, 0x74, "??", "??", 0x8D, 0x4F]

F8::
(i := !i) ? t := 1962872178 : t := 1962872180
drawskeleton := csgo.modulePatternScan("client.dll", Pattern*)
csgo.write(drawskeleton + 2, t, "uint")
Return