/*// Código do menu em C
// Início onde tem headers, declaração de variáveis globais e etc
// Estes dois enum servem apenas para facilitar a compreensão do código
typedef enum itens
{
    Item1 = 1,
    Item2
};
typedef enum telas
{
    Menu,
    Tela1,
    Tela2
} Telas;

//*************************************************************************
// Menu de opções do programa
//*************************************************************************
void menu(uint8_t *Tela_de_destino)
{
    // declare aqui as suas variáveis locais
    itens menu;
    uint8_t retornar = 0;
    uint8_t posição_do_menu = Item1, posição_anterior_do_menu = Item2;
    while (retornar == 0)
    {
        // Escreva aqui o seu código do que vai acontecer no menu, sejam animações, tocar um beep quando apertar uma tecla e etc
        if (posição_anterior_do_menu != posição_do_menu)
        {
            switch (posição_do_menu)
            {
            case Item1:
            {
                // escreva aqui o código que vai desenhar seu menu em C quando o primeiro item estiver selecionado.
                // pode ser que nem o do GIF, uma seta do lado indicando, mudar a cor do texto.
                break;
            }
            case Item2:
            {
                // escreva aqui o código que vai desenhar seu menu em C quando o segundo item estiver selecionado.
                // pode ser que nem o do GIF, uma seta do lado indicando, mudar a cor do texto.
                break;
            }
            case default:
                break; // deu ruim!
            }
            posição_anterior_do_menu = posição_do_menu;
        }
        // código responsável por ler botões, encoder e etc pra mudar a posição selecionada no menu
        if (botão_pra_baixo == 1 && posição_do_menu != Item2)
            posição_do_menu++;
        else if (botão_pra_cima == 1 && posição_do_menu != Item1)
            posição_do_menu--;
        // Se pressionado o botão pra selecionar o item em destaque no menu, saia do menu
        if (botão_de_seleção == 1)
            retornar = 1;
    }
    *Tela_de_destino = posição_do_menu;
}
//*************************************************************************
// Tela1, selecionada no menu pelo "Item1"
//*************************************************************************
void tela1(uint8_t *Tela_de_destino)
{
    // declare aqui as suas variáveis locais
    uint8_t retornar = 0;
    while (retornar == 0)
    {
        // Escreva aqui o seu código do que vai acontecer nesta tela, como mostrar ou receber dados, acender um LED, etc
        LED1 = 1;
        // Aqui é a condição de retorno/saída da tela. Pode ser um botão pressionado, uma interrupção, um comando pelo terminal.
        if (botão_de_seleção == 1)
            retornar = 1;
    }
    // ao sair desta tela, retorna para o menu. Você pode mudar isto nesta linha.
    *Tela_de_destino = Menu;
}
//*************************************************************************
// Tela2, selecionada no menu pelo "Item1"
//*************************************************************************
void tela2(uint8_t *Tela_de_destino)
{
    // declare aqui as suas variáveis locais
    uint8_t retornar = 0;
    while (retornar == 0)
    {
        // Escreva aqui o seu código do que vai acontecer nesta tela, como mostrar ou receber dados, acender um LED, etc
        LED2 = 1;
        // Aqui é a condição de retorno/saída da tela. Pode ser um botão pressionado, uma interrupção, um comando pelo terminal.
        if (botão_de_seleção == 1)
            retornar = 1;
    }
    // ao sair desta tela, retorna para o menu. Você pode mudar isto nesta linha.
    *Tela_de_destino = Menu;
}
//*************************************************************************
// Função principal
//*************************************************************************
void main()
{
    // declare aqui as suas variáveis locais
    uint8_t Tela_de_destino = Menu;
    // insira aqui o restante do código da sua main
    while (1)
    {
        // este é o loop do seu programa. Pra quem programa Arduino, este while é sua função loop()
        // insira aqui o que quiser, desde que não bloqueie o funcionamento do switch abaixo
        // Este switch é responsável por fazer seu programa ir de uma tela para a outra
        switch (Tela_de_destino)
        {
        case Menu:
        {
            menu(&Tela_de_destino);
            break;
        }
        case Tela1:
        {
            tela1(&Tela_de_destino);
            break;
        }
        case Tela2:
        {
            tela2(&Tela_de_destino);
            break;
        }
        }
    }
}
*/
