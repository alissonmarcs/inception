# qual UNIX user será o owner dos arquivos do wordpress ?

# qual UNIX user executará os processos do php ?

# quais são os arquivos de config de exemplo que o pacote php-fpm fornece ?

/etc/php/7.4/fpm/php-fpm.conf
/etc/php/7.4/fpm/pool.d/www.conf
 
# como criar uma docker network ?

# como adicionar container a uma network ?

# como exportar uma porta do container para uma porta no host ?

# como o php-fpm sabe qual scritp executar ?

Q: o nginx (que está em um container, e tem um filesystem isolado) roteia requests para o php-fmp
(está em outro container, e também tem um filesystem isolado). como o php-fpm sabe onde buscar o script
php ?

R: a mesma estrutura de arquivos precisa existir em ambos os containers.
o nginx, ao receber uma request, vai validar se esse arquivo existe, e caso
positivo, repassa essa request ao php-fpm. no repasse dessa request,
é enviado várias informações, inclusive o caminho absoluto do script
php requisitado. o php-fpm usa essa informação para executar o scrip.

por isso, a mesma estrutura de pastas precisa existir em ambos os
containers, isso pode ser atingido usando um volume compartilhado entre
os dois containers.

# como printar as variaveis do arquivo de config do nginx ?
no arquivo de config, vc pode criar uma location que retorna
uma string hard coded, e nessa string, vc pode recerenciar
as variaveis que tem interesse.

# 
