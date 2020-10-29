=====================================PROJETO=====================================

Projeto:    Implementação Paralela do Problema N-Bodies
Autores:    Alexandre Thurow Bender e Moniele Kunrath Santos
Contato:    atbender@inf.ufpel.edu.br, mksantos@inf.ufpel.edu.br

======================================SOBRE======================================

Esse projeto consiste em uma implementação de paralelização utilizando OpenMP no problema n-bodies.
Essa implementação foi feita utilizando o código serial disponibilizado pelo professor.

====================================CONTEÚDOS====================================

Os conteúdos desse projeto consistem em:
    - README.txt                                    (o presente arquivo de instruções)
    - main.cpp                                      (onde foram implementadas as modificações)
    - nbodies.cpp                                   (não sofreu alterações)
    - nbodies.hpp                                   (não sofreu alterações)
    - /logs                                         (diretório para onde são enviados os relatórios utilizando make-full-small, make-full-big e make-full-all)
    - /input_files                                  (diretório contendo os arquivos de entrada que configuram as especificações do problema)
    - /input_files/nbody_input-16384_16384.in       (arquivo de especificação do problema para uma execução de tamanho pequena)
    - /input_files/nbody_input-32768_32768.in       (arquivo de especificação do problema para uma execução de tamanho grande)
    - Makefile                                      (makefile para automatizar a execução do programa)

====================================INSTRUÇÕES====================================

O programa pode ser utilizado com os seguintes comandos make:

make                                                    compila o programa.

make run <arquivo_de_entrada> <número_de_threads>       compila e executa o programa utilizando o arquivo de entrada e o número de threads especificado.
make run-small <número_de_threads>                      compila e executa o programa utilizando o arquivo de entrada com a especificação pequena e o número de threads especificado.
make run-big <número_de_threads>                        compila e executa o programa utilizando o arquivo de entrada com a especificação grande e o número de threads especificado.

make run-full-small                                     compila e executa o programa utilizando o arquivo de entrada com a especificação pequena múltiplas vezes (com 1, 2, 4, 8, 16 e 32 threads). O resultado das execuções se encontra no subdiretório logs.
make run-full-big                                       compila e executa o programa utilizando o arquivo de entrada com a especificação grande múltiplas vezes (com 1, 2, 4, 8, 16 e 32 threads). O resultado das execuções se encontra no subdiretório logs.
make run-full-all                                       compila e executa o programa com run-full-small e depois run-full-big.

make clean                                              remove os arquivos de objeto do diretório.
make clean-logs                                         remove os arquivos de relatório do subdiretório logs.


The code can also be compiled manually with:
g++ -fopenmp main.cpp nbody.cpp -lpthread -std=c++11 -o nbody_simulation

And executed with:
./nbody_simulation <input_file> <number_of_threads>

==================================================================================