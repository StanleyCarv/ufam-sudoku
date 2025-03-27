%Universidade Federal do Amazonas
%Aluno: Stanley de Carvalho Monteiro - 21950882
%Data: 27/03/2025


:- use_module(library(readutil)).  % Para ler entradas do usuário

% Define os números permitidos
num(1).
num(2).

% Regras do Sudoku 2x2
sudoku([[A, B], [C, D]]) :-
    num(A), num(B), num(C), num(D),  % Valores permitidos
    A \= B,  % Linha 1 não pode repetir
    C \= D,  % Linha 2 não pode repetir
    A \= C,  % Coluna 1 não pode repetir
    B \= D.  % Coluna 2 não pode repetir

% Exibir tabuleiro
exibir_tabuleiro([[A, B], [C, D]]) :-
    format('~w ~w\n~w ~w\n', [A, B, C, D]).

% Pedir entrada do usuário e jogar
jogar :-

    writeln('Preencha a matriz com 1 ou 2 seguindo as regras.'),
    writeln('Digite cada número e pressione ENTER.'),

    % Alteração: usar read_line_to_string/2
    ler_entrada('Linha 1, Coluna 1:', A),
    ler_entrada('Linha 1, Coluna 2:', B),
    ler_entrada('Linha 2, Coluna 1:', C),
    ler_entrada('Linha 2, Coluna 2:', D),

    Tabuleiro = [[A, B], [C, D]],

    writeln('\nTabuleiro inserido:'),
    exibir_tabuleiro(Tabuleiro),

    ( sudoku(Tabuleiro) ->
        writeln('Solução VÁLIDA! Parabéns!')
    ; 
        writeln('Solução INVÁLIDA! Tente novamente.')
    ).

% Função para ler entrada e garantir que seja 1 ou 2
ler_entrada(Pergunta, Valor) :-
    writeln(Pergunta),
    read_line_to_string(user_input, Input),  % Ler a entrada como string
    (   num_string(Input, Valor)
    ->  true
    ;   writeln('Entrada inválida. Por favor, insira 1 ou 2.'),
        ler_entrada(Pergunta, Valor)
    ).

% Converter string para número
num_string("1", 1).
num_string("2", 2).