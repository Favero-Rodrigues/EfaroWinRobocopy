@echo off

:: Variáveis
set origem=C:\
set destino=D:\backup
set log=D:\backup\backup.log
set erro_log=D:\backup\erro.log
set opcoes_robocopy=/MIR /Z /R:5 /W:10 /LOG:%log% /V /TEE /NP

:: Imprimir mensagem de início
echo Iniciando o backup completo do disco C: para o disco D:
echo Iniciando o backup completo do disco C: para o disco D: >> %log%

:: Comando Robocopy
robocopy %origem% %destino% %opcoes_robocopy% /XD "C:\Windows" "C:\Program Files" /XF "C:\pagefile.sys" "C:\hiberfil.sys" /XJ

:: Verifica se o comando Robocopy foi bem-sucedido
if %errorlevel% equ 0 (
    echo Backup concluído com sucesso.
    echo Backup concluído com sucesso. >> %log%
) else (
    echo Erro durante o backup. Verifique o log em %erro_log% para mais detalhes.
    echo Erro durante o backup em %date% %time% >> %erro_log%
)

pause