# EfaroWinRobocopy

Script em Batch para Windows que utiliza o Robocopy para copiar pastas do usuário e outros arquivos importantes do disco C: para um disco externo D:. Ele inclui regras de reinício automático e realiza uma cópia completa.

Este script realizará um backup completo do disco C: para o disco D:, excluindo os diretórios e arquivos especificados, e gerando logs para análise posterior.

```batch
@echo off

:: Variáveis em português do Brasil
set origem=C:\
set destino=D:\backup
set log=D:\backup\backup.log
set erro_log=D:\backup\erro.log
set opcoes_robocopy=/MIR /Z /R:5 /W:10 /LOG:%log% /V /TEE /NP

:: Mensagem de início
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
```

## Explicação das opções do Robocopy:
- `/MIR`: Espelha a estrutura de diretórios (isso exclui arquivos e pastas no destino que não existem mais na origem).
- `/Z`: Copia arquivos em modo reiniciável.
- `/R:5`: Tenta copiar os arquivos 5 vezes em caso de falha.
- `/W:10`: Espera 10 segundos entre cada tentativa.
- `/LOG:%log%`: Grava o log da operação no arquivo especificado.
- `/V`: Produz saída detalhada.
- `/TEE`: Exibe a saída no console e no log.
- `/NP`: Não exibe a porcentagem de progresso.
- `/XD`: Exclui diretórios específicos (neste caso, exclui as pastas `Windows` e `Program Files`).
- `/XF`: Exclui arquivos específicos (neste caso, exclui `pagefile.sys` e `hiberfil.sys`).
- `/XJ`: Exclui pontos de junção (junction points) e links simbólicos.

## Utilizar o algortimo:
1. Execute o script clicando duas vezes no arquivo ou via linha de comando.

Este script realizará um backup completo do disco C: para o disco D:, excluindo os diretórios e arquivos especificados, e gerando logs para análise posterior.