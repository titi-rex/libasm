##
# libasm
#
# @file
# @version 0.2


#	==============================	NAME	==============================	#
NAME		=	libasm.a
NAME_BONUS	=	libasm_bonus.a


#	==============================	CMP	==============================	#
ASM			=	nasm
ASMFLAG		=	-w+x -f elf64 
DEPFLAG		=	-MD $@.dep

AR			=	ar
ARFLAG		=	rcs

CC			=	gcc 
CFLAG		=	-Wall -Wextra -Werror 


#	==============================	INCLUDE	==============================	#
DIR_INC		=	include/
IFLAG		=	-I ${DIR_INC}


#	==============================	SRC	==============================	#
DIR_SRC		=	src/
LST_SRC		=	ft_strlen.s ft_strcpy.s ft_strcmp.s ft_strdup.s ft_write.s ft_read.s
SRC			=	${addprefix ${DIR_SRC}, ${LST_SRC}}


#	==============================	OBJ	==============================	#
DIR_OBJ		=	.obj/
LST_OBJ		=	${LST_SRC:.s=.o}
OBJ			=	${addprefix ${DIR_OBJ}, ${LST_OBJ}}


#	==============================	BONUS	==============================	#
LST_SRC_BONUS	=	ft_atoi_base_bonus.s ft_lst_push_front_bonus.s ft_lst_size_bonus.s ft_lst_sort_bonus.s ft_lst_remove_if_bonus.s 
SRC_BONUS		=	${addprefix ${DIR_SRC}, ${LST_SRC_BONUS}}

LST_OBJ_BONUS	=	${LST_SRC_BONUS:.s=.o}
OBJ_BONUS		=	${addprefix ${DIR_OBJ}, ${LST_OBJ_BONUS}}



#	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	RULES	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	#
.PHONY: all clean fclean
#	==============================	BASE	==============================	#
all: ${NAME}

clean:
	@rm -rf ${DIR_OBJ}
	@echo "Clean"

fclean: clean
	@rm -f ${NAME}
	@rm -f ${NAME_BONUS}
	@echo "FClean"

re: fclean all


#	==============================	COMPILATION	==============================	#
${NAME}: ${DIR_OBJ} ${OBJ}
	${AR} ${ARFLAG} $@ ${OBJ}

bonus: ${NAME} ${OBJ_BONUS}
	${AR} ${ARFLAG} ${NAME} ${OBJ_BONUS}

${DIR_OBJ}%.o: ${DIR_SRC}%.s
	${ASM} ${ASMFLAG} ${DEPFLAG} $< -o $@

-include ${DIR_OBJ}/*.dep


#	==============================	UTILS	==============================	#
${DIR_OBJ}:
	@mkdir ${DIR_OBJ}



# end
