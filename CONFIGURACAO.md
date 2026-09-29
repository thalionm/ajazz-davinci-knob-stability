# Mapa das cenas e configuração manual

Este documento descreve as cenas fornecidas em [`scenes`](./scenes/) e serve como referência para controladoras genéricas que não importam `.SDProfile`.

## Como ler os knobs

Nas tabelas, os três comandos aparecem na ordem:

1. giro no primeiro sentido;
2. giro no sentido oposto;
3. clique no encoder.

Se os sentidos ficarem invertidos, troque somente as duas primeiras hotkeys. Os nomes exatos das teclas podem variar com o layout do teclado e o software da controladora.

## DaVinci Resolve

Download: [`DaVinci Resolve.SDProfile`](./scenes/DaVinci%20Resolve.SDProfile)

Aplicativo sugerido: `Resolve.exe`. O perfil público usa o caminho padrão em `C:\Program Files`; selecione manualmente o executável se o Resolve estiver em outra unidade.

| Controle | Ação/hotkey |
|---|---|
| Botão 1 | seleção — `A` |
| Botão 2 | copiar — `Ctrl+C` |
| Botão 3 | lâmina — `B` |
| Botão 4 | colar — `Ctrl+V` |
| Botão 5 | cortar/dividir — `Ctrl+B` |
| Botão 6 | excluir — `Backspace` |
| Knob de reprodução | `Left` / `Right` / `Space` |
| Knob de zoom | `Ctrl+F5` / `Ctrl+F4` / `Shift+Z` |
| Knob de rolagem | `Ctrl+F7` / `Ctrl+F8` / `Ctrl+F` |
| Botões extras | desfazer `Ctrl+Z`, selecionar à frente `Alt+Y`, refazer `Ctrl+Shift+Z` |

Os atalhos `Ctrl+F4`, `Ctrl+F5`, `Ctrl+F7` e `Ctrl+F8` são interceptados pelo script e convertidos em roda do mouse com limitação de frequência.

## Canva

Download: [`Canva.SDProfile`](./scenes/Canva.SDProfile)

O caminho do aplicativo Canva depende do usuário do Windows e foi removido da cópia pública. Associe novamente a cena ao `Canva.exe` ou ative-a manualmente.

| Controle | Ação/hotkey |
|---|---|
| Botões | texto `T`, copiar `Ctrl+Shift+C`, busca `/`, colar `Ctrl+V`, camada à frente `Alt+C`, camada atrás `Alt+B` |
| Knob de zoom | `Ctrl+F12` / `Ctrl+F11` / `Ctrl+Alt+0` |
| Knob vertical | `Ctrl+F9` / `Ctrl+F10` / `Shift+R` |
| Knob horizontal | `Ctrl+F7` / `Ctrl+F8` / `Ctrl+Enter` |
| Botões extras | desfazer `Ctrl+Shift+Alt+Z`, excluir `Delete`, refazer `Ctrl+Shift+Z` |

## Chrome

Download: [`Chrome.SDProfile`](./scenes/Chrome.SDProfile)

Inclui atalhos para ChatGPT/Codex, Mixkit, Gemini, YouTube, Vidu e Core na Tela, além de uma página secundária com Deezer, Netflix e Globoplay.

| Controle | Ação/hotkey |
|---|---|
| Botões principais | abrir sites e aplicativo ChatGPT/Codex |
| Knob de volume | volume do sistema |
| Knob vertical | `Ctrl+F1` / `Ctrl+F2` / `Ctrl+Tab` |
| Knob/página | mudar de página |
| Navegação | voltar `Alt+Left`, atualizar `F5`, avançar `Alt+Right` |

Reconfigure a ação **Abrir aplicativo** do ChatGPT/Codex se o identificador do aplicativo for diferente no computador de destino.

## Photoshop

Download: [`Photoshop.SDProfile`](./scenes/Photoshop.SDProfile)

O perfil foi criado para Photoshop 2024. Se outra versão estiver instalada, selecione o executável correspondente.

| Controle | Ação/hotkey |
|---|---|
| Botões | `L`, `P`, `Shift+J`, `E`, `V`, `S` |
| Knob de zoom | `Ctrl+Numpad-` / `Ctrl+Numpad+` / `Ctrl+1` |
| Knob de pincel | `[` / `]` / `B` |
| Knob de tamanho/ajuste | `Ctrl+Shift+,` / `Ctrl+Shift+.` / `T` |
| Botões extras | rotação entre perfis internos |

Os perfis internos incluídos preservam as páginas ligadas à cena principal.

## Controlar Windows

Download: [`Controlar Windows.SDProfile`](./scenes/Controlar%20Windows.SDProfile)

| Controle | Ação/hotkey |
|---|---|
| Botão | voltar `Alt+Left` |
| Botões de aplicativo | DaVinci Resolve, Canva, Chrome e Deezer |
| Botões do sistema | mostrar desktop `Win+D`, fechar `Alt+F4` |
| Knob de volume | volume do sistema |
| Knob de captura | `Win+Numpad-` / `Win+Numpad+` / `PrintScreen` |
| Botão de mídia | faixa anterior |
| Botão de mídia | parar/reproduzir conforme a ação multimídia do Stream Dock |

A página interna contém outros atalhos e lançadores. O inventário completo de programas da máquina original foi removido. Reconfigure cada ação **Abrir aplicativo** e a ação **Escolher pasta**.

## VLC

Download: [`VLC.SDProfile`](./scenes/VLC.SDProfile)

| Controle | Ação/hotkey |
|---|---|
| Mídia | ações multimídia do sistema |
| Abrir Explorador | `Win+E` |
| Trocar áudio | plugin de seleção de saída — requer nova configuração |
| Volume | volume do sistema |
| Knob de lupa | `Win+-` / `Win+=` / `Win+Esc` |
| Knob de navegação | `Shift+Left` / `Shift+Right` / `F` |
| Sistema | desktop `Win+D`, alternar `Win+Tab`, minimizar `Win+Down` |

## Consola de música

Download: [`Consola de música.SDProfile`](./scenes/Consola%20de%20m%C3%BAsica.SDProfile)

Baseada em VLC e controles multimídia do Windows.

| Controle | Ação/hotkey |
|---|---|
| Mídia | ações multimídia do sistema |
| Abrir Explorador | `Win+E` |
| Trocar áudio | plugin de seleção de saída — requer nova configuração |
| Volume | volume do sistema |
| Knob de zoom | `Alt+I` / `Alt+O` / `Z` |
| Knob de navegação | `Shift+Left` / `Shift+Right` / `Alt+Enter` |
| Sistema | desktop `Win+D`, alternar `Win+Tab`, fechar `Alt+F4` |

## Deezer

Download: [`Deezer.SDProfile`](./scenes/Deezer.SDProfile)

A versão e o caminho do aplicativo da Microsoft Store mudam com atualizações; associe novamente o executável ou ative a cena manualmente.

| Controle | Ação/hotkey |
|---|---|
| Mídia | ações multimídia do sistema |
| Abrir Explorador | `Win+E` |
| Trocar áudio | plugin de seleção de saída — requer nova configuração |
| Volume | volume do sistema |
| Knob vertical | `Ctrl+F9` / `Ctrl+F10` / `Win+Up` |
| Navegação | `Alt+Left` / `Alt+Right` / `F5` |
| Sistema | desktop `Win+D`, alternar `Win+Tab`, minimizar `Win+Down` |

## Windows Media Player

Download: [`WMP.SDProfile`](./scenes/WMP.SDProfile)

A cena não tem aplicativo associado na cópia original; ative-a manualmente ou selecione o executável do player usado.

| Controle | Ação/hotkey |
|---|---|
| Mídia | ações multimídia do sistema |
| Abrir Explorador | `Win+E` |
| Trocar áudio | plugin de seleção de saída — requer nova configuração |
| Volume | volume do sistema |
| Knob de lupa | `Win+-` / `Win+=` / `Win+Esc` |
| Knob de navegação | `Left` / `Right` / `Alt+Enter` |
| Sistema | desktop `Win+D`, alternar `Win+Tab`, minimizar `Win+Down` |

## Compatibilidade e adaptação

- `.SDProfile` funciona no ecossistema Stream Dock e costuma exigir o mesmo modelo físico.
- Em outro modelo Ajazz/Nacodex/MiraBox, importe para testar, mas não estranhe se a cena ficar invisível: o fabricante documenta que cenas são associadas ao modelo.
- Em Elgato, Loupedeck, Touch Portal, Macro Deck, MIDI-to-key ou outras controladoras, recrie os atalhos manualmente.
- Se uma controladora envia MIDI/CC em vez de teclas, use o software dela para converter cada giro em hotkeys ou adote uma ponte MIDI específica.
- Atalhos de aplicativo podem mudar conforme idioma, versão e personalização. Teste cada ação no teclado antes de culpar a controladora.
- Prefira hotkeys pouco usadas, como `Ctrl+F1` a `Ctrl+F12`, para a comunicação entre controladora e AutoHotkey.
- Não associe duas ações ao mesmo pulso e evite opções de repetição automática nos encoders.
