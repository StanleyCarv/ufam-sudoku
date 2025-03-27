% Universidade Federal do Amazonas
% Aluno: Stanley de Carvalho Monteiro - 21950882
% Data: 27/03/2025

:- use_module(library(readutil)).  % Para ler entradas do usuário

% Define os números permitidos
num(1).
num(2).
num(3).

% Regras do Sudoku 3x3
sudoku([[A, B, C], [D, E, F], [G, H, I]]) :-
    num(A), num(B), num(C), num(D), num(E), num(F), num(G), num(H), num(I),  % Valores permitidos
    A \= B, A \= C, B \= C,  % Linha 1 não pode repetir
    D \= E, D \= F, E \= F,  % Linha 2 não pode repetir
    G \= H, G \= I, H \= I,  % Linha 3 não pode repetir
    A \= D, A \= G,  % Coluna 1 não pode repetir
    B \= E, B \= H,  % Coluna 2 não pode repetir
    C \= F, C \= I.  % Coluna 3 não pode repetir

% Exibir tabuleiro
exibir_tabuleiro([[A, B, C], [D, E, F], [G, H, I]]) :-
    format('~w ~w ~w\n~w ~w ~w\n~w ~w ~w\n', [A, B, C, D, E, F, G, H, I]).

% Pedir entrada do usuário e jogar
jogar :-
    writeln('Preencha a matriz 3x3 com os números de 1 a 3 seguindo as regras.'),
    writeln('Digite cada número e pressione ENTER.'),

    % Alteração: usar read_line_to_string/2 para garantir que seja lido como string
    ler_entrada('Linha 1, Coluna 1:', A),
    ler_entrada('Linha 1, Coluna 2:', B),
    ler_entrada('Linha 1, Coluna 3:', C),
    ler_entrada('Linha 2, Coluna 1:', D),
    ler_entrada('Linha 2, Coluna 2:', E),
    ler_entrada('Linha 2, Coluna 3:', F),
    ler_entrada('Linha 3, Coluna 1:', G),
    ler_entrada('Linha 3, Coluna 2:', H),
    ler_entrada('Linha 3, Coluna 3:', I),

    Tabuleiro = [[A, B, C], [D, E, F], [G, H, I]],

    writeln('\nTabuleiro inserido:'),
    exibir_tabuleiro(Tabuleiro),

    ( sudoku(Tabuleiro) ->
        writeln('Solução VÁLIDA! Parabéns!')
    ; 
        writeln('Solução INVÁLIDA! Tente novamente.')
    ).

% Função para ler entrada e garantir que seja um número válido
ler_entrada(Pergunta, Valor) :-
    writeln(Pergunta),
    read_line_to_string(user_input, Input),  % Ler a entrada como string
    (   num_string(Input, Valor)
    ->  true
    ;   writeln('Entrada inválida. Por favor, insira 1, 2 ou 3.'),
        ler_entrada(Pergunta, Valor)
    ).

% Converter string para número
num_string("1", 1).
num_string("2", 2).
num_string("3", 3).
