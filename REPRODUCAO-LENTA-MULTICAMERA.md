# Reprodução lenta dentro do multicâmera: taxa de reprodução diferente

## Caso validado

Correção testada pelo usuário no **DaVinci Resolve gratuito 21.1, Build 14 (`21.1.00014`), no Windows**.

- Projeto e linha do tempo principal: **24 fps**.
- Clipe multicâmera: **30 fps**.
- Taxa de reprodução nas definições do projeto: **24 fps**.
- A linha do tempo principal reproduzia normalmente: dez segundos reais correspondiam a dez segundos no contador.
- Ao abrir a **linha do tempo interna do multicâmera**, a reprodução parecia lenta em todo o vídeo. Dez segundos reais correspondiam a aproximadamente oito segundos no contador, mesmo com o indicador de reprodução verde em 24 fps.

O teste de mudar **somente a Taxa de Quadros de Reprodução de 24 para 30** normalizou a reprodução interna, conforme confirmação do usuário. A relação `24 / 30 = 0,8` é compatível com a velocidade observada antes do ajuste.

Este é um caso de diferença entre a taxa da linha do tempo interna e a taxa de reprodução. Não é evidência de falha dos knobs, AutoHotkey ou Stream Dock, nem de que todo multicâmera com taxa diferente da linha do tempo principal necessariamente terá o problema.

## Passo a passo: trabalhar dentro do multicâmera de 30 fps

1. Abra a **linha do tempo interna do multicâmera** que está em 30 fps.
2. Clique na **engrenagem**, no canto inferior direito do Resolve, para abrir as definições do projeto.
3. Na coluna esquerda, clique em **Definições Master**.
4. Localize **Taxa de Quadros de Reprodução**.
5. Altere **apenas esse campo**, de **24 para 30 fps**.
6. **Não altere Taxa de Quadros da Linha do Tempo**, os atributos dos arquivos de origem nem a velocidade dos clipes.
7. Clique em **Salvar**.
8. Reproduza o multicâmera e compare dez segundos de um cronômetro com o avanço do contador interno. Confira também a reprodução do áudio e da imagem.

No caso documentado, o usuário confirmou que esse ajuste funcionou. Não foi necessário recriar o multicâmera, reconstruir a composição nem refazer a sincronização manual no Fairlight.

## Ao voltar à linha do tempo principal de 24 fps

**O ajuste é feito nas definições do projeto; não o trate como uma preferência exclusiva do multicâmera.**

1. Volte à linha do tempo principal de **24 fps**.
2. Abra novamente a **engrenagem > Definições Master**.
3. Retorne **Taxa de Quadros de Reprodução para 24 fps**.
4. Clique em **Salvar** e confirme a reprodução em tempo real.

Para este fluxo: **30 fps de reprodução ao trabalhar dentro do multicâmera de 30 fps; 24 fps ao voltar à linha do tempo principal de 24 fps**. A restauração para 24 é uma precaução de fluxo; a confirmação explícita do usuário nesta sessão foi do ajuste que normalizou o multicâmera.

## Limites e cuidados

- O procedimento muda a taxa de reprodução, não converte o multicâmera para 24 fps e não desloca os clipes sincronizados.
- O indicador verde informa que a taxa de reprodução está sendo atingida; isoladamente, não garante que ela corresponda à taxa da linha do tempo interna aberta.
- Não use esta orientação como correção universal para engasgos, áudio dessincronizado ou queda de desempenho. Se a taxa já corresponde à linha do tempo aberta, investigue outra causa.
- Não se afirma que o caso foi reproduzido em outras versões ou em todas as builds.
- Este problema é separado da [falha de atalhos em tela cheia](./FALHA-TELA-CHEIA-RESOLVE.md).

## Referência

O [Guia oficial de edição do DaVinci Resolve 18](https://documents.blackmagicdesign.com/UserManuals/DaVinci-Resolve-18-Editors-Guide.pdf?_v=1680159610000) apresenta separadamente a taxa da linha do tempo e a taxa de reprodução nas definições do projeto. A validação específica deste procedimento no Resolve 21.1 Build 14 vem do teste real descrito acima, não de uma declaração do guia sobre esta build.
