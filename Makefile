# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: karisti- <karisti-@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/20 13:16:39 by karisti-          #+#    #+#              #
#    Updated: 2023/11/02 18:39:29 by karisti-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# Project compilation files and directories

NAME	=	libft.a

CFILE	=	ft_atoi.c				\
			ft_bzero.c				\
			ft_calloc.c				\
			ft_isalnum.c			\
			ft_isalpha.c			\
			ft_isascii.c			\
			ft_isdigit.c			\
			ft_isprint.c			\
			ft_itoa.c				\
			ft_memccpy.c			\
			ft_memchr.c				\
			ft_memcmp.c				\
			ft_memcpy.c				\
			ft_memmove.c			\
			ft_memset.c				\
			ft_putchar_fd.c			\
			ft_putendl_fd.c			\
			ft_putnbr_fd.c			\
			ft_putstr_fd.c			\
			ft_split.c				\
			ft_strchr.c				\
			ft_strdup.c				\
			ft_strjoin.c			\
			ft_strlcat.c			\
			ft_strlcpy.c			\
			ft_strlen.c				\
			ft_strmapi.c			\
			ft_strncmp.c			\
			ft_strnstr.c			\
			ft_strrchr.c			\
			ft_strtrim.c			\
			ft_substr.c				\
			ft_tolower.c			\
			ft_toupper.c			\
			
CFILEB	=	ft_lstadd_back_bonus.c	\
			ft_lstadd_front_bonus.c	\
			ft_lstclear_bonus.c		\
			ft_lstdelone_bonus.c	\
			ft_lstiter_bonus.c		\
			ft_lstlast_bonus.c		\
			ft_lstmap_bonus.c		\
			ft_lstnew_bonus.c		\
			ft_lstsize_bonus.c		\

SRCSFD	=	srcs/
SRCSFDB	=	srcs/bonus/
OBJSFD	=	bin/objs/
OBJSFDB	=	bin/objs/
HDR_INC	=	-I./includes
BIN		=	bin/

SRCS	=	$(addprefix $(SRCSFD), $(CFILE))
SRCS_B	=	$(addprefix $(SRCSFDB), $(CFILEB))
OBJS	=	$(addprefix $(OBJSFD), $(CFILE:.c=.o))
OBJS_B	=	$(addprefix $(OBJSFDB), $(CFILEB:.c=.o))
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Compilation
COMP	=	gcc
CFLAGS	=	-Wall -Wextra -Werror
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Colors
RED		=	\033[0;31m
GREEN	=	\033[0;32m
NONE	=	\033[0m
# # # # # # # # # # # # # # # # # # # # # # # # # # # # #

all: project $(NAME)
	@echo "... libft ready"

project:
	@echo "Checking libft ..."

projectb:
	@echo "Checking libft with bonus ..."

$(OBJSFD):
	@mkdir -p $@
	@echo "\t[ $(GREEN)✔$(NONE) ] $@ directory"

$(OBJSFD)%.o: $(SRCSFD)%.c
	@$(COMP) $(CFLAGS) $(HDR_INC) -o $@ -c $<
	@echo "\t[ $(GREEN)✔$(NONE) ] $@ object"

$(OBJSFDB)%.o: $(SRCSFDB)%.c
	@$(COMP) $(CFLAGS) $(HDR_INC) -o $@ -c $<
	@echo "\t[ $(GREEN)✔$(NONE) ] $@ object"

$(NAME): $(OBJSFD) $(OBJS)
	@ar rc $(BIN)$(NAME) $(OBJS)
	@ranlib $(BIN)$(NAME)
	@echo "\t[ $(GREEN)✔$(NONE) ] $@ library"

bonus: projectb $(OBJSFD) $(OBJS) $(OBJS_B)
	@ar rc $(BIN)$(NAME) $(OBJS) $(OBJS_B)
	@ranlib $(BIN)$(NAME)
	@echo "\t[ $(GREEN)✔$(NONE) ] $(NAME) bonus library"
	@echo "... libft ready"

clean:
	@/bin/rm -rf $(OBJSFD)
	@echo "\t[ $(RED)✗$(NONE) ] libft Objects directory"

fclean: clean
	@/bin/rm -rf $(BIN)
	@echo "\t[ $(RED)✗$(NONE) ] libft library"

re: fclean all

.PHONY: project projectb all clean fclean re
