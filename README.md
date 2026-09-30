# Ajazz/Nacodex + DaVinci Resolve: cenas, ícones e knobs estáveis

Pacote em português para controladoras **Ajazz/Nacodex AKP03E** e outros modelos que usam o software Stream Dock, com instruções para recriar os mesmos atalhos em controladoras genéricas.

O repositório reúne:

- a correção em AutoHotkey v1 para knobs que enviam pulsos demais e fazem o DaVinci Resolve parar de responder;
- nove cenas prontas em `.SDProfile`;
- 58 ícones PNG para personalização;
- tabelas para reproduzir cada cena em outras controladoras, mesmo quando o arquivo `.SDProfile` não é compatível.

> O limitador dos knobs foi inicialmente validado no Windows com AutoHotkey v1.1.37.02 e DaVinci Resolve 20.3.2 (Build 9). Testes posteriores no **DaVinci Resolve gratuito 21.1, Build 14**, confirmaram uma falha independente do Resolve ao editar com o **Visualizador Cinema** em tela cheia no segundo monitor. Consulte o [aviso dedicado](./FALHA-TELA-CHEIA-RESOLVE.md). Cenas do Stream Dock são vinculadas ao modelo; em outro modelo ou software, use as tabelas de configuração manual.

## Downloads

- [Script estabilizador — Rolagem-DaVinci.ahk](./Rolagem-DaVinci.ahk)
- [Cenas prontas](./scenes/)
- [Ícones PNG](./icons/)
- [Mapa completo das cenas e dos softwares](./CONFIGURACAO.md)
- [Diagnóstico de atalhos seletivos do Resolve](./DIAGNOSTICO-ATALHOS-RESOLVE.md)
- [Falha do Visualizador Cinema em tela cheia](./FALHA-TELA-CHEIA-RESOLVE.md)
- [Origem e licença dos recursos visuais](./ASSETS.md)
- [Verificação de integridade SHA-256](./SHA256SUMS)
- [Política de segurança](./SECURITY.md)

## Segurança dos downloads

Use somente este repositório oficial. Antes de importar uma cena ou executar o script, compare o SHA-256 do arquivo com [`SHA256SUMS`](./SHA256SUMS). No PowerShell:

```powershell
Get-FileHash -Algorithm SHA256 ".\arquivo-baixado"
```

As cenas públicas não contêm número de série, IDs de áudio nem caminhos pessoais. A cena “Controlar Windows” foi publicada sem comandos de desligar, reiniciar, suspender ou encerrar sessão. Endereços externos somente são abertos quando o respectivo botão é pressionado.

## O problema tratado pelo script

O problema inicial aparecia depois de muitos giros rápidos dos knobs:

- a controladora deixava de responder dentro do DaVinci Resolve;
- os atalhos do teclado também paravam de funcionar apenas no Resolve;
- o teclado continuava normal nos outros programas;
- trocar de programa e aguardar um pouco fazia o Resolve voltar.

O comportamento não correspondia a um `Ctrl` preso. O padrão era compatível com uma fila de eventos sobrecarregada: um encoder pode emitir dezenas ou centenas de pulsos por segundo, enquanto o Resolve pode consumi-los mais devagar.

O limitador tornou os knobs estáveis no teste de estresse, mas **não deve ser apresentado como correção completa para todo problema de teclado do Resolve**. Testes posteriores mostraram que `A`, `B`, `Ctrl+B` e `Alt+Y` podem falhar tanto na controladora quanto no teclado físico quando o **Visualizador Cinema** permanece em tela cheia no segundo monitor. A falha também foi reproduzida usando somente teclado e mouse, com AutoHotkey e Stream Dock fechados. Sair da tela cheia restaura imediatamente os comandos. Esse comportamento do Resolve é tratado separadamente em [`FALHA-TELA-CHEIA-RESOLVE.md`](./FALHA-TELA-CHEIA-RESOLVE.md).

`#MaxHotkeysPerInterval 2000` somente aumenta o limite de advertência do AutoHotkey. Essa diretiva não aumenta a tolerância do Windows e não impede que o Resolve receba uma rajada excessiva.

## Como a correção funciona

O script aplica um limitador independente para cada função do knob quando o Resolve está ativo:

- no máximo um evento por canal a cada **40 ms** — cerca de 25 por segundo;
- pulsos excedentes são descartados imediatamente;
- os dois sentidos do mesmo knob compartilham o mesmo canal;
- não há `Sleep`, `KeyWait` nem fila artificial;
- fora do Resolve, as hotkeys continuam sem limitação;
- o ajuste de parâmetro com clique sustentado recebe a mesma proteção.

O teste que originou esta publicação permaneceu estável após pelo menos dois minutos de giros repetidos em todos os knobs. Isso valida o controle da rajada dos encoders, não o subsistema de atalhos internos do Resolve.

## Instalação recomendada — Ajazz/Nacodex

### 1. Instale os programas

1. Instale o aplicativo **Stream Dock** indicado para o seu modelo Ajazz/Nacodex. O manual do AKP03E orienta usar o aplicativo Stream Dock fornecido pelo fabricante.
2. Instale o [AutoHotkey v1.1](https://www.autohotkey.com/). O script usa sintaxe v1 e não funciona no v2 sem adaptação.
3. Instale ou abra os aplicativos cujas cenas pretende usar: DaVinci Resolve, Canva, Chrome, Photoshop, VLC, Deezer ou Windows Media Player.

Conecte a controladora diretamente a uma porta USB durante a configuração inicial. Se houver desconexões físicas, teste sem hub antes de alterar atalhos.

### 2. Faça backup

No Stream Dock:

1. abra **Settings/Configurações > Scenes/Cenas**;
2. selecione suas cenas atuais;
3. use o botão **Export Scene/Exportar cena**;
4. guarde os arquivos exportados fora da pasta do programa.

Também faça uma cópia do seu `.ahk` atual. Nenhuma cena deste repositório precisa substituir o seu único backup.

### 3. Importe as cenas

Baixe a cena desejada na pasta [`scenes`](./scenes/). Depois use um destes métodos:

- dê duplo clique no arquivo `.SDProfile`; ou
- abra **Settings/Configurações > Scenes/Cenas**, clique em **Import Scene/Importar cena** e escolha o arquivo.

Os perfis foram exportados para o modelo identificado internamente como `20GBA9901`, da família AKP03E. O Stream Dock associa cenas ao modelo. Se a importação terminar mas a cena não aparecer, provavelmente o modelo conectado não corresponde ao perfil.

### 4. Revise as dependências após importar

Por segurança, as cópias públicas foram limpas de número de série, nome de usuário, IDs de áudio e inventário de programas instalados. Portanto, revise:

- **Aplicativo associado à cena:** selecione novamente o executável do Canva, Resolve, Photoshop, Deezer etc.;
- **Abrir aplicativo:** confirme o caminho de ChatGPT/Codex, DaVinci Resolve, Canva, Chrome, Deezer e Stream Dock;
- **Trocar dispositivo de áudio:** selecione novamente as duas saídas no plugin;
- **Abrir pasta:** escolha sua própria pasta na cena “Controlar Windows”;
- **Plugins ausentes:** reinstale o plugin indicado pelo Stream Dock ou substitua a ação por uma hotkey manual.

Associação automática é conveniente, mas não obrigatória. Uma cena também pode ser ativada manualmente.

### 5. Instale e execute o script

1. baixe [`Rolagem-DaVinci.ahk`](./Rolagem-DaVinci.ahk);
2. feche qualquer cópia antiga pelo ícone verde `H` na área de notificação;
3. execute o arquivo com AutoHotkey v1;
4. após alterações, clique com o botão direito no `H` e escolha **Reload This Script**.

Mantenha apenas uma instância. Duas cópias fariam cada pulso ser processado duas vezes.

### 6. Teste

1. abra o DaVinci Resolve;
2. teste todos os botões e os dois sentidos de cada knob;
3. gire os knobs repetidamente por pelo menos dois minutos;
4. confirme que os atalhos do teclado continuam funcionando no Resolve;
5. teste as outras cenas e confira a troca automática de aplicativo.

Se apenas `A`, `B`, `Ctrl+B`, `Alt+Y` ou outros comandos específicos da linha do tempo falharem enquanto o **Visualizador Cinema** estiver em tela cheia, saia da tela cheia com `Ctrl+F` e consulte o [aviso dedicado](./FALHA-TELA-CHEIA-RESOLVE.md). Aumentar indefinidamente o limite do AutoHotkey não corrige esse caso.

## Configuração em controladoras genéricas

Arquivos `.SDProfile` não são um padrão universal. Perfis podem ser específicos do fabricante, do software, do sistema operacional e do modelo físico. Em uma controladora genérica:

1. crie uma camada/perfil para cada aplicativo;
2. associe cada botão às hotkeys descritas em [`CONFIGURACAO.md`](./CONFIGURACAO.md);
3. faça os knobs emitirem as combinações da tabela abaixo, uma vez por pulso;
4. execute o mesmo script AutoHotkey v1 em segundo plano;
5. se o software permitir, associe o perfil ao executável do aplicativo; caso contrário, troque a camada manualmente.

| Hotkey emitida | Evento gerado pelo script | Uso nas cenas fornecidas |
|---|---|---|
| `Ctrl+F11` | `Ctrl+WheelUp` | zoom do Canva |
| `Ctrl+F12` | `Ctrl+WheelDown` | zoom do Canva |
| `Ctrl+F4` | `Alt+WheelUp` | zoom do Resolve |
| `Ctrl+F5` | `Alt+WheelDown` | zoom do Resolve |
| `Ctrl+F7` | `WheelLeft` | rolagem horizontal |
| `Ctrl+F8` | `WheelRight` | rolagem horizontal |
| `Ctrl+F1` | três passos de `WheelUp` | rolagem rápida no Chrome |
| `Ctrl+F2` | três passos de `WheelDown` | rolagem rápida no Chrome |
| `Ctrl+F9` | `WheelUp` | rolagem vertical |
| `Ctrl+F10` | `WheelDown` | rolagem vertical |
| `Ctrl+F3` | quinze passos de `WheelDown` | salto de página opcional |

O terceiro comando de cada knob normalmente corresponde ao clique no encoder. Ele pode ser configurado diretamente no software da controladora e não precisa passar pelo script, salvo quando indicado.

## Ajustando a sensibilidade

O intervalo padrão fica nesta linha:

```ahk
SendControllerEvent(channel, keys, interval := 40)
```

- `30` ms: resposta mais rápida, com menos proteção;
- `40` ms: valor recomendado e validado;
- `50` ou `60` ms: mais proteção caso o problema reapareça;
- valores muito altos fazem o knob parecer lento.

Altere somente o número, salve, recarregue o script e repita o teste de estresse.

## Ajuste de parâmetros do Inspector

O bloco final do script converte `Left` e `Right` em movimento horizontal do mouse apenas quando:

- o Resolve está ativo; e
- o botão esquerdo físico do mouse está pressionado.

Isso permite sustentar o clique sobre um parâmetro do Inspector e usar o knob central para ajustá-lo. Se sua controladora não envia `Left`/`Right`, mude essas duas hotkeys ou ignore o bloco.

## Por que não usar `Sleep` ou `KeyWait`?

Esses comandos podem manter uma execução ocupada enquanto novos pulsos chegam. Isso pode gerar atraso, perda de resposta ou apenas deslocar o congestionamento. O limitador por tempo retorna imediatamente e não acumula trabalho.

## Por que `{Blind}` aparece somente no `Ctrl+Wheel`?

`{Blind}` evita que o AutoHotkey solte ou restaure modificadores desnecessariamente durante as combinações com `Ctrl`. Ele foi mantido apenas onde é útil. A correção principal continua sendo o controle da frequência, não a liberação manual de `Ctrl`.

## Iniciar com o Windows — opcional

1. pressione `Win+R`;
2. digite `shell:startup`;
3. crie nessa pasta um atalho para `Rolagem-DaVinci.ahk`.

## Diagnóstico rápido

Se ainda houver travamento:

1. confirme que somente uma instância do script está ativa;
2. aumente o intervalo de `40` para `50` ou `60` ms;
3. confira se o software da controladora não repete macros além dos pulsos físicos;
4. teste outra porta USB, sem hub;
5. verifique se o problema permanece restrito ao Resolve;
6. se o teclado falhar também em outros programas, investigue USB, driver e firmware;
7. se apenas uma ação importada falhar, refaça o caminho do aplicativo, a saída de áudio ou o plugin daquela ação.

Se a falha estiver restrita a alguns comandos da timeline, verifique também:

1. se o **Visualizador Cinema** está em tela cheia em outro monitor;
2. se sair da tela cheia com `Ctrl+F` restaura imediatamente os comandos;
3. se os controles **Seleção Automática** das pistas estão ligados e se as pistas relevantes estão desbloqueadas;
4. se o mesmo comando funciona pelo menu ou pela barra de ferramentas no instante da falha;
5. se o problema também ocorre com AutoHotkey e Stream Dock fechados desde antes de abrir o Resolve.

## Reverter

Feche o script pelo ícone verde `H` e volte a executar sua cópia de backup. Para as cenas, use seu arquivo exportado anteriormente ou exclua apenas a cena importada no Stream Dock. O script não altera o DaVinci Resolve, o registro do Windows nem o firmware.

## Referências

- [Manual do Ajazz AKP03E — instalação e Stream Dock](https://manuals.plus/ae/1005007498827221)
- [MiraBox — importar, exportar e fazer backup de cenas](https://mirabox.net/de/blogs/tutorial/how-to-use-export-scene-and-import-scene-on-streamdock)
- [AutoHotkey — Send / SendInput](https://ahk4.us/docs/commands/Send.htm)
- [AutoHotkey — #MaxHotkeysPerInterval](https://ahk4.us/docs/commands/_MaxHotkeysPerInterval.htm)
- [AutoHotkey — #MenuMaskKey](https://ahk4.us/docs/commands/_MenuMaskKey.htm)
- [Blackmagic Forum — keyboard shortcuts stop working](https://forum.blackmagicdesign.com/viewtopic.php?f=21&t=71678)
- [Blackmagic Forum — atalhos quebrados em atualização anterior](https://forum.blackmagicdesign.com/viewtopic.php?f=21&start=0&t=82010&uid=16)
- [Blackmagic Forum — Alt+Y e timelines empilhadas](https://forum.blackmagicdesign.com/viewtopic.php?f=38&t=202573)
- [Blackmagic Forum — atalhos personalizados que deixam de responder](https://forum.blackmagicdesign.com/viewtopic.php?p=587323&t=105669)
- [Guia oficial do Resolve 20 — seleção à frente com Y e Alt+Y](https://documents.blackmagicdesign.com/UserManuals/DaVinci-Resolve-20-Editors-Guide.pdf?_v=1757574010000)
- [Discussão sobre limitar eventos rápidos de scroll](https://www.reddit.com/r/AutoHotkey/comments/umnru0/)
- [Discussão sobre debounce de encoder rotativo](https://www.reddit.com/r/AutoHotkey/comments/1tz4i7s/rautohotkey/)
- [Perfis são específicos de dispositivo e sistema](https://docs.elgato.com/stream-deck/profiles/getting-started/)

## Licença

O script e a documentação estão sob licença MIT. Os ícones e marcas têm termos separados em [`ASSETS.md`](./ASSETS.md).
