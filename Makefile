# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: karisti- <karisti-@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/20 13:16:39 by karisti-          #+#    #+#              #
#    Updated: 2023/11/02 19:13:57 by karisti-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# Project compilation files and directories

NAME	=	libft.a

# Original Libft
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

# Original Libft Bonus
CFILEB	=	ft_lstadd_back_bonus.c	\
			ft_lstadd_front_bonus.c	\
			ft_lstclear_bonus.c		\
			ft_lstdelone_bonus.c	\
			ft_lstiter_bonus.c		\
			ft_lstlast_bonus.c		\
			ft_lstmap_bonus.c		\
			ft_lstnew_bonus.c		\
			ft_lstsize_bonus.c		\

# Libft Extra functions
CFILEE	=	ft_atol.c				\
			ft_strisnum.c			\
			ft_putchar.c			\
			ft_putstr.c				\
			ft_putnbr.c				\
			ft_strtoupper.c			\
			ft_memalloc.c			\
			ft_itoabase.c			\
			ft_ltoa.c				\
			ft_strfromchar.c		\
			ft_strjoinchar.c		\
			ft_get_next_line.c		\

# Libft Bonus Extra functions
CFILEBE	=	ft_lstprint_bonus.c		\
			ft_lstrem_bonus.c		\

SRCSFD		=	srcs/
SRCSFDB		=	srcs/bonus/
SRCSFDE		=	srcs/extras/
SRCSFDBE	=	srcs/extras/bonus/
OBJSFD		=	bin/objs/
HDR_INC		=	-I./includes
BIN			=	bin/

SRCS	=	$(addprefix $(SRCSFD), $(CFILE))
SRCS_E	=	$(addprefix $(SRCSFDE), $(CFILEE))
SRCS_B	=	$(addprefix $(SRCSFDB), $(CFILEB))
SRCS_BE	=	$(addprefix $(SRCSFDBE), $(CFILEBE))

OBJS	=	$(addprefix $(OBJSFD), $(CFILE:.c=.o))
OBJS_E	=	$(addprefix $(OBJSFD), $(CFILEE:.c=.o))
OBJS_B	=	$(addprefix $(OBJSFD), $(CFILEB:.c=.o))
OBJS_BE	=	$(addprefix $(OBJSFD), $(CFILEBE:.c=.o))
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

projectbe:
	@echo "Checking libft with extras ..."

$(OBJSFD):
	@mkdir -p $@
	@echo "\t[ $(GREEN)✔$(NONE) ] $@ directory"

$(OBJSFD)%.o: $(SRCSFD)%.c
	@$(COMP) $(CFLAGS) $(HDR_INC) -o $@ -c $<
	@echo "\t[ $(GREEN)✔$(NONE) ] $@ object"

$(OBJSFD)%.o: $(SRCSFDE)%.c
	@$(COMP) $(CFLAGS) $(HDR_INC) -o $@ -c $<
	@echo "\t[ $(GREEN)✔$(NONE) ] $@ object"

$(OBJSFD)%.o: $(SRCSFDB)%.c
	@$(COMP) $(CFLAGS) $(HDR_INC) -o $@ -c $<
	@echo "\t[ $(GREEN)✔$(NONE) ] $@ object"

$(OBJSFD)%.o: $(SRCSFDBE)%.c
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

extras: projectbe $(OBJSFD) $(OBJS) $(OBJS_E) $(OBJS_B) $(OBJS_BE)
	@ar rc $(BIN)$(NAME) $(OBJS) $(OBJS_E) $(OBJS_B) $(OBJS_BE)
	@ranlib $(BIN)$(NAME)
	@echo "\t[ $(GREEN)✔$(NONE) ] $(NAME) extra library"
	@echo "... libft ready"

clean:
	@/bin/rm -rf $(OBJSFD)
	@echo "\t[ $(RED)✗$(NONE) ] libft Objects directory"

fclean: clean
	@/bin/rm -rf $(BIN)
	@echo "\t[ $(RED)✗$(NONE) ] libft library"

re: fclean all

rebonus: fclean bonus

reextras: fclean extras

.PHONY: project projectb all clean fclean re
