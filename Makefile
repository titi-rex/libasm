##
# libasm
#
# @file
# @version 0.2


#	==============================	NAME	==============================	#
NAME		=	libasm.a
NAME_BONUS	=	libasm_bonus.a
TEST_EXE	=	asmtest.out


#	==============================	CMP	==============================	#
ASM			=	nasm
ASMFLAG		=	-w+x -f elf64 -g -F dwarf
DEPFLAG		=	-MD $@.dep

AR			=	ar
ARFLAG		=	rcs

CC			=	gcc 
CFLAG		=	-Wall -Wextra -Werror -g3 #-fsanitize=address,leak,undefined 


#	==============================	INCLUDE	==============================	#
DIR_INC		=	include/
IFLAG		=	-I ${DIR_INC}


#	==============================	SRC	==============================	#
BASE		=	strlen strcpy strcmp strdup write read 
DIR_SRC		=	src/
LST_SRC		=	ft_strlen.s ft_strcpy.s ft_strcmp.s ft_strdup.s ft_write.s ft_read.s
SRC			=	${addprefix ${DIR_SRC}, ${LST_SRC}}


#	==============================	OBJ	==============================	#
DIR_OBJ		=	.obj/
LST_OBJ		=	${LST_SRC:.s=.o}
OBJ			=	${addprefix ${DIR_OBJ}, ${LST_OBJ}}


#	==============================	BONUS	==============================	#
LST_SRC_BONUS	=	ft_atoi_base.s ft_lst_push_front.s ft_lst_size.s ft_lst_sort.s ft_lst_remove_if.s 
SRC_BONUS		=	${addprefix ${DIR_SRC}, ${LST_SRC_BONUS}}

LST_OBJ_BONUS	=	${LST_SRC_BONUS:.s=.o}
OBJ_BONUS		=	${addprefix ${DIR_OBJ}, ${LST_OBJ_BONUS}}


#	==============================	TEST	==============================	#
DIR_TEST		=	test/
LST_TEST_SRC	=	main.c utils.c strlen.c strcpy.c strcmp.c strdup.c write.c read.c atoi_base.c list_push_front.c list_size.c list_sort.c list_remove_if.c 
TEST_SRC		=	${addprefix ${DIR_TEST}, ${LST_TEST_SRC}}


LST_TEST_OBJ	=	${LST_TEST_SRC:.c=.o}
TEST_OBJ		=	${addprefix ${DIR_OBJ}, ${LST_TEST_OBJ}}



#	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	RULES	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	#
.PHONY: all clean fclean
#	==============================	BASE	==============================	#
all: ${TEST_EXE}

bonus: ${NAME_BONUS}

clean:
	@rm -rf ${DIR_OBJ}
	@echo "Clean"

fclean: clean
	@rm -f ${NAME}
	@rm -f ${NAME_BONUS}
	@rm -f ${TEST_EXE}
	@echo "FClean"

re: fclean all


#	==============================	COMPILATION	==============================	#
${NAME}: ${DIR_OBJ} ${OBJ} ${OBJ_BONUS}
	${AR} ${ARFLAG} $@ ${OBJ} ${OBJ_BONUS}

${NAME_BONUS}: ${NAME} ${DIR_OBJ} ${OBJ} ${OBJ_BONUS}
	${AR} ${ARFLAG} ${NAME_BONUS} ${OBJ} ${OBJ_BONUS}

${DIR_OBJ}%.o: ${DIR_SRC}%.s
	${ASM} ${ASMFLAG} ${DEPFLAG} $< -o $@

-include ${DIR_OBJ}/*.dep


#	==============================	UTILS	==============================	#
${DIR_OBJ}:
	@mkdir ${DIR_OBJ}


#	==============================	TEST	==============================	#
${TEST_EXE}:	${NAME_BONUS} ${TEST_OBJ}
	${CC} ${IFLAG} ${CFLAG} ${TEST_OBJ} ${NAME_BONUS} -o ${TEST_EXE} 

${DIR_OBJ}%.o:	${DIR_TEST}%.c
	${CC} ${IFLAG} ${CFLAG} -c $< -o $@


# end
