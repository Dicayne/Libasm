# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vmoreau <vmoreau@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/20 13:11:26 by vmoreau           #+#    #+#              #
#    Updated: 2020/04/24 19:56:42 by vmoreau          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

####################################COLOR######################################
#----------------reset----------------#
NC = \033[0m

#-----------Regular Colors------------#
BLACK = \033[0;30m
RED = \033[0;31m
GREEN = \033[32m
YELLOW = \033[33;33m
BLUE = \033[0;34m
PURPLE = \033[35m
CYAN = \033[1;36m
WHITE = \033[0;37m

###################################SOURCES#####################################

SRC +=	src/ft_strlen.s		src/ft_write.s		src/ft_read.s	\
		src/ft_strcpy.s		src/ft_strcmp.s		src/ft_strdup.s	\

#####################################BASIC#####################################

OBJ = $(SRC:%.s=%.o)

EXE = asm

#####################################RULES#####################################

all: $(NAME)

$(NAME): echoCL $(OBJ) echoOK echoAR
	ar rc $@ $(OBJ)
	gcc -o $(EXE) $@ src/main.c -fsanitize=address
	printf "$(GREEN)Compilation Success $(RED)./asm Ready!!$(NC)\n"

%.o: %.s
	nasm -f macho64 $^
	printf "$(CYAN).$(NC)"

clean: echoCLEAN
	rm -rf $(OBJ)

fclean: clean echoFCLEAN
	rm -rf $(NAME)
	rm -rf $(EXE)

re: fclean all

#####################################ECHO######################################
echoCL:
	echo "$(YELLOW)===> Compiling $(RED)Libasm.a$(NC)"
echoOK:
	echo "$(GREEN)OK$(NC)"
echoCLEAN :
	echo "$(PURPLE)===> Cleanning OBJS$(NC)"
echoFCLEAN :
	echo "$(PURPLE)===> Cleanning Exec$(NC)"
echoAR :
	echo "$(CYAN)===> Archiving Liasm$(NC)"

.PHONY : all clean fclean re
.SILENT :