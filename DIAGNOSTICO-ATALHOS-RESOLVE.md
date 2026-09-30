# Diagnóstico: `A`, `B`, `Ctrl+B` e `Alt+Y` deixam de funcionar no Resolve

## Situação confirmada

Depois que o limitador de pulsos estabilizou os giros dos knobs, surgiu um comportamento mais específico. A investigação posterior identificou o **Visualizador Cinema em tela cheia no segundo monitor** como gatilho:

- `A`, `B`, `Ctrl+B` e `Alt+Y` deixam de funcionar dentro do DaVinci Resolve;
- os mesmos atalhos falham tanto na controladora quanto no teclado físico;
- os demais botões e atalhos continuam funcionando;
- o teclado funciona normalmente em outros programas;
- `Alt+Tab`, menus, submenus e Inspector não restauram os comandos;
- encerrar completamente AutoHotkey e Stream Dock não os restaura;
- a falha foi reproduzida usando somente teclado e mouse, com AutoHotkey e Stream Dock fechados desde antes de abrir o Resolve;
- sair do modo de tela cheia restaura imediatamente todos os comandos, sem reiniciar o Resolve.

Esses resultados descartam como causa a controladora, uma desconexão USB, um travamento geral do teclado, um `Ctrl` permanentemente pressionado ou uma captura pelo AutoHotkey. O estado defeituoso pertence ao contexto de comandos do próprio Resolve enquanto o **Visualizador Cinema** permanece em tela cheia.

Consulte [`FALHA-TELA-CHEIA-RESOLVE.md`](./FALHA-TELA-CHEIA-RESOLVE.md) para a solução prática validada na edição gratuita.

## O que os três comandos têm em comum

Os quatro pertencem ao contexto de edição da linha do tempo:

- `A`: **Modo de Seleção**;
- `B`: **Modo de Corte**;
- `Ctrl+B`: comando de corte na posição do cursor de reprodução;
- `Alt+Y`: **Selecionar Clipes à Frente em Todas as Pistas**.

`Ctrl+B` e `Alt+Y` dependem do estado das pistas. Controles **Auto Select**, destino de pista, pistas bloqueadas, clips selecionados e timelines empilhadas podem mudar o resultado ou fazer o comando parecer inativo. O guia oficial do Resolve confirma que `Y` e `Alt+Y` são comandos contextuais da timeline.

Entretanto, a falha simultânea de `A` e `B` é decisiva: esses atalhos deveriam trocar ferramentas na página **Editar** independentemente da Seleção Automática das pistas. O fato de saírem do estado defeituoso ao abandonar a tela cheia confirma uma falha no encaminhamento contextual de comandos do Resolve.

## Relatos comparáveis

Há registros de longa data no fórum da Blackmagic de:

- apenas alguns atalhos deixarem de responder enquanto outros continuam ativos;
- comandos voltarem sem uma causa clara;
- atalhos funcionarem em uma versão e falharem após atualização;
- comandos de timeline pararem depois de scroll, reprodução ou outra mudança de estado na página Edit;
- `Alt+Y` se comportar incorretamente quando timelines empilhadas estão em uso;
- presets personalizados mostrarem a combinação correta, mas o comando não ser executado.

Isso não identifica uma única causa, mas confirma que o Resolve possui falhas internas e dependências de contexto capazes de produzir esse padrão sem defeito no teclado ou na controladora.

## Testes decisivos no momento da falha

Execute os testes abaixo antes de esperar a recuperação:

1. **Teste o comando, não somente a tecla.**
   - Clique no ícone de lâmina da barra da timeline para comparar com `B`.
   - Use **Timeline > Select Clips Forward > Select Clips Forward on All Tracks** para comparar com `Alt+Y`.
   - Localize **Razor** em **Keyboard Customization** e confirme se a combinação continua registrada.
   - Se o menu ou botão também falhar, o comando/contexto da timeline está indisponível; se o menu funcionar, a falha está no mapeamento/despachante de teclado.

2. **Confira as pistas.**
   - Ative os botões **Auto Select** (`<>`) nas pistas relevantes.
   - Desbloqueie temporariamente uma pista de vídeo e uma de áudio.
   - Remova a seleção de clips e coloque o playhead sobre clips existentes.
   - Teste `Ctrl+B` e `Alt+Y` novamente.

3. **Compare uma timeline nova.**
   - Crie um projeto de teste vazio, importe um clip e crie uma timeline simples.
   - Se os comandos funcionarem nela enquanto continuam falhando no projeto original, investigue estado da timeline, pistas, timelines empilhadas e corrupção específica do projeto.
   - Se falharem em todos os projetos, investigue preset de teclado e versão do Resolve.

4. **Atribua atalhos temporários alternativos.**
   - Exporte primeiro o preset atual.
   - Atribua combinações temporárias diferentes a Blade Edit Mode, Razor e Select Clips Forward on All Tracks.
   - Se os novos atalhos funcionarem quando `B`, `Ctrl+B` e `Alt+Y` falham, o defeito está nas combinações/preset.
   - Se as combinações novas também falharem, o defeito está no contexto ou nos comandos da timeline.

5. **Feche somente o projeto, sem encerrar o Resolve.**
   - Abra o Project Manager e carregue um projeto mínimo.
   - Se os comandos continuarem falhando, o estado está no processo/sessão do Resolve.
   - Se voltarem sem reiniciar o programa, investigue o projeto ou a timeline original.

## Solução validada

Na edição gratuita, use o **Visualizador Cinema** em tela cheia somente para reproduzir, pausar, avançar, retroceder, percorrer a linha do tempo e conferir a imagem. Saia da tela cheia com `Ctrl+F` antes de executar comandos de edição.

Se os atalhos já tiverem parado, sair da tela cheia os restaura imediatamente. Não é necessário reiniciar o Resolve, trocar de projeto ou encerrar AutoHotkey/Stream Dock.

No Resolve Studio, a alternativa apropriada é **Área de Trabalho > Saída de Vídeo Limpa** (*Video Clean Feed*) para enviar a imagem ao segundo monitor sem usar uma janela interativa em tela cheia.

Mais detalhes: [`FALHA-TELA-CHEIA-RESOLVE.md`](./FALHA-TELA-CHEIA-RESOLVE.md).

## Outras verificações, se a falha ocorrer fora da tela cheia

### 1. Reconstruir o preset a partir do padrão

1. Abra **Keyboard Customization**.
2. Exporte o preset atual como backup.
3. Selecione o preset interno **DaVinci Resolve**.
4. Salve uma nova cópia com outro nome.
5. Pesquise `B`, `Ctrl+B` e `Alt+Y` e remova atribuições duplicadas ou conflitantes.
6. Refaça manualmente somente as personalizações necessárias; não importe imediatamente o preset antigo.
7. Reinicie o Resolve e repita o teste.

Presets personalizados e conflitos entre comandos globais e comandos de painel aparecem repetidamente em relatos da comunidade. Criar uma cópia nova a partir do padrão é mais confiável que continuar regravando um preset possivelmente inconsistente.

### 2. Restaurar o layout da interface

Use **Área de Trabalho > Redefinir Layout da Interface**, retorne à página **Editar**, clique diretamente na linha do tempo e teste novamente. Isso não apaga projetos nem mídia; apenas reorganiza a interface e pode limpar um contexto de painel incorreto. Esta opção pode ficar indisponível enquanto um modo de tela cheia está ativo; saia primeiro da tela cheia.

### 3. Desativar temporariamente timelines empilhadas

Se **Stacked Timelines** estiver ativo, deixe apenas uma timeline visível e repita `Alt+Y`. Há relato específico de conflito desse atalho com tabs de timelines empilhadas.

### 4. Comparar versões do Resolve

Como a falha passou a aparecer mais cedo e deixou de se recuperar sozinha após a atualização:

- registre a versão e o build exatos;
- repita o mesmo projeto e a mesma sequência em uma timeline de teste;
- se possível, compare com a versão anterior usando instalador oficial e backup atualizado do banco de projetos;
- considere a versão atual uma possível regressão até que o mesmo teste seja repetido na versão anterior;
- não conclua que a versão mais nova resolveu o problema apenas porque contém “melhorias gerais de estabilidade”.

Uma regressão de versão passa a ser hipótese forte quando mudam de forma repetível tanto o tempo até a falha quanto o método necessário para recuperar o aplicativo.

### 5. Gerar diagnóstico para a Blackmagic

Logo após reproduzir a falha, use **Help > Create Diagnostics Log on Desktop** e registre:

- versão/build do Resolve;
- Windows e layout/idioma do teclado;
- página ativa;
- se o menu equivalente funciona;
- estado de Auto Select e bloqueio das pistas;
- uso ou não de Stacked Timelines;
- tempo e sequência aproximada até a falha;
- confirmação de que AutoHotkey e Stream Dock foram encerrados sem restaurar os comandos.
- confirmação de que, na versão atual, apenas reiniciar o Resolve restaura os comandos.

Esse conjunto permite reportar um defeito reproduzível em vez de um relato genérico de “teclado travando”.

## O que não fazer

- não aumente ainda mais `#MaxHotkeysPerInterval` esperando corrigir esses três comandos;
- não transfira todos os botões para AutoHotkey antes de testar preset e contexto da timeline;
- não apague preferências ou bancos de projetos sem backup;
- não atribua a causa ao cabo ou à porta USB enquanto os mesmos atalhos físicos falharem somente dentro do Resolve;
- não confunda uma pista sem Auto Select ou bloqueada com falha de teclado.
- não use o **Visualizador Cinema** como ambiente confiável para editar na versão gratuita; limite-o à reprodução e navegação.

## Referências

- [Blackmagic Design — DaVinci Resolve 20 Editors Guide](https://documents.blackmagicdesign.com/UserManuals/DaVinci-Resolve-20-Editors-Guide.pdf?_v=1757574010000)
- [Blackmagic Forum — Keyboard Shortcuts stop working regularly](https://forum.blackmagicdesign.com/viewtopic.php?f=21&t=71678)
- [Blackmagic Forum — 15.2 shortcut keys broken](https://forum.blackmagicdesign.com/viewtopic.php?f=21&start=0&t=82010&uid=16)
- [Blackmagic Forum — Select clip forward / Stacked Timelines](https://forum.blackmagicdesign.com/viewtopic.php?f=38&t=202573)
- [Blackmagic Forum — Keyboard Customization not working](https://forum.blackmagicdesign.com/viewtopic.php?p=587323&t=105669)
- [Blackmagic Forum — atalhos de marcadores param após scroll/reprodução](https://forum.blackmagicdesign.com/viewtopic.php?f=21&t=187498)
- [Discussão sobre `Ctrl+B`, `Alt+Y` e Auto Select no Resolve 20](https://www.reddit.com/r/davinciresolve/comments/1njzrug)
- [Atalhos deixam de funcionar no Visualizador Cinema](https://www.reddit.com/r/davinciresolve/comments/1esftyh/)
- [Atalhos voltam ao sair do Visualizador Cinema](https://www.reddit.com/r/davinciresolve/comments/11ep3bk/)
- [Blackmagic Forum — funcionalidade de edição em tela cheia](https://forum.blackmagicdesign.com/viewtopic.php?p=1085054&t=209059)
