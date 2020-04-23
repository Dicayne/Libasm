# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vmoreau <vmoreau@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/20 13:11:26 by vmoreau           #+#    #+#              #
#    Updated: 2020/04/23 02:56:00 by vmoreau          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC +=	src/ft_strlen.s		src/ft_write.s		src/ft_read.s	\
		src/ft_strcpy.s		src/ft_strcmp.s		src/ft_strdup.s	\

OBJ = $(SRC:%.s=%.o)

NAME = libasm.a

EXE = asm

all: $(NAME)

$(NAME): $(OBJ)
	ar rc $@ $(OBJ)
	gcc -o $(EXE) $@ src/main.c

%.o: %.s
	nasm -f macho64 $^

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)
	rm -rf $(EXE)

re: fclean all