# Falha de atalhos no Visualizador Cinema do DaVinci Resolve gratuito

## Resumo

Há uma falha recorrente do **Visualizador Cinema** em tela cheia no segundo monitor, com relatos equivalentes em diferentes versões do DaVinci Resolve. Neste equipamento, a falha ocorreu diretamente no **DaVinci Resolve gratuito 20.3.2, Build 9**, e no **21.1, Build 14 (`21.1.00014`)**, no Windows. A recuperação imediata ao sair da tela cheia foi validada diretamente na versão 21.1 Build 14.

Depois de algum tempo nesse modo, comandos de edição específicos deixam de responder tanto no teclado físico quanto na controladora. O AutoHotkey e o Stream Dock não precisam estar em execução para a falha ocorrer.

Na versão 20.3.2 Build 9, os comandos ainda podiam retornar sozinhos após algum tempo; na 21.1 Build 14, passaram a permanecer inativos até a saída da tela cheia. Os testes e os relatos comparáveis demonstram que o problema não é exclusivo da versão 21.1. Ainda assim, não se afirma que todas as builds sejam necessariamente afetadas, nem que o comportamento seja idêntico em todas elas.

## Sintomas confirmados

- `A`, `B`, `Ctrl+B` e `Alt+Y` deixam de responder;
- os comandos correspondentes aparecem cinza em menus como **Aparar**;
- o **Modo de Corte** ainda pode ser escolhido manualmente pelo menu da seta ao lado do **Modo de Seleção**;
- `Ctrl+4`, `Esc`, `Alt+Tab` e clicar na linha do tempo não restauram os comandos;
- outras linhas do tempo do mesmo projeto apresentam o mesmo estado;
- sair do modo de tela cheia restaura imediatamente todos os comandos;
- entrar em outro projeto e voltar também restaura o estado, porque reconstrói a interface.

O problema foi reproduzido em uma sessão usando **somente teclado e mouse**, com AutoHotkey e Stream Dock completamente fechados. Isso descarta a controladora e o script deste repositório como causa necessária.

## Causa identificada

O gatilho é o **Visualizador Cinema** em tela cheia no segundo monitor. Esse modo pode deixar de encaminhar corretamente os comandos contextuais de edição para a linha do tempo. Sair da tela cheia reconstrói o contexto e faz os atalhos voltarem.

É uma falha do próprio Resolve, independente do limitador de pulsos dos knobs. Relatos de outros usuários descrevem o mesmo padrão: atalhos funcionam inicialmente no Visualizador Cinema, falham de forma intermitente depois e voltam ao sair da tela cheia.

Portanto, a orientação abaixo não deve ser entendida como exclusiva da versão 21.1. Ela é aplicável como primeiro teste em outras versões sempre que a falha surgir durante o uso do Visualizador Cinema.

## Solução prática validada na versão gratuita

Na edição gratuita, use o **Visualizador Cinema** apenas para operações de transporte e navegação que permanecerem funcionais, por exemplo:

- reproduzir e pausar;
- avançar e retroceder;
- percorrer a linha do tempo;
- conferir a imagem em tela cheia.

Antes de executar comandos de edição, saia da tela cheia. O atalho padrão para alternar o **Visualizador Cinema** é `Ctrl+F`.

Não confie no Visualizador Cinema para operações como:

- alternar entre **Modo de Seleção** e **Modo de Corte**;
- cortar com `Ctrl+B`;
- selecionar clipes à frente com `Alt+Y`;
- outros comandos contextuais da linha do tempo.

Se os atalhos já tiverem parado, saia da tela cheia com `Ctrl+F`. No caso validado, isso restaura imediatamente o teclado e a controladora, sem reiniciar o Resolve e sem trocar de projeto.

## Alternativa no Resolve Studio

O Resolve Studio oferece **Área de Trabalho > Saída de Vídeo Limpa** (*Video Clean Feed*). Essa é a forma apropriada de manter a imagem em tela cheia no segundo monitor sem transformar o visualizador em uma janela interativa que assume o contexto dos atalhos.

Normalmente é necessário desativar **Área de Trabalho > Tela Dupla** antes de escolher o monitor em **Saída de Vídeo Limpa**. Esta alternativa não foi validada neste equipamento, que usa a edição gratuita.

## O que não resolve esta falha

- aumentar `#MaxHotkeysPerInterval`;
- encerrar AutoHotkey ou Stream Dock depois que a falha apareceu;
- trocar cabo, porta USB ou teclado;
- pressionar `Ctrl+4` para selecionar a linha do tempo;
- clicar em menus, no Inspector ou na própria linha do tempo;
- esperar que os atalhos retornem sozinhos.

## Referências comparáveis

- [Atalhos deixam de funcionar no Visualizador Cinema](https://www.reddit.com/r/davinciresolve/comments/1esftyh/)
- [Atalhos voltam ao sair do Visualizador Cinema](https://www.reddit.com/r/davinciresolve/comments/11ep3bk/)
- [Visualizador em tela cheia desativa atalhos](https://www.reddit.com/r/davinciresolve/comments/1cild36/)
- [Discussão no fórum da Blackmagic sobre funções de edição em tela cheia](https://forum.blackmagicdesign.com/viewtopic.php?p=1085054&t=209059)
