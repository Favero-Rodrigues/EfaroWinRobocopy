# Grupo Favero Rodrigues
# https://www.faverorodrigues.com.br
# Versão: 1.0
## Cópia da estacão e envia para pasta de backup
$RotationDay = Get-Date -Format ddd
$Origem = 'C:\UNI'
$Destino = '\\srv-fls-01.efaro.local\Uni$\'+$RotationDay+'_UNIworkstation'
$LogRobocopy = '\\srv-fls-01.efaro.local\Uni$\Logs\'+$RotationDay+'_workstation.log'
robocopy $Origem $Destino /mir /r:0 /w:0 /log:$LogRobocopy /np