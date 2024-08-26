##
# libasm
#
# @file
# @version 0.2


#	==============================	NAME	==============================	#
NAME		=	libasm.a
TEST_EXE	=	asmtest.out


#	==============================	CMP	==============================	#
ASM			=	nasm
ASMFLAG		=	-f elf64 -g
DEPFLAG		=	-MD $@.dep

AR			=	ar
ARFLAG		=	rcs

CC			=	gcc 
CFLAG		=	-Wall -Wextra -Werror #-g3 -fsanitize=address 


#	==============================	INCLUDE	==============================	#
DIR_INC		=	include/
IFLAG		=	-I ${DIR_INC}


#	==============================	SRC	==============================	#
DIR_SRC		=	src/
LST_SRC		=	ft_strlen.s ft_strcpy.s ft_strcmp.s ft_strdup.s ft_write.s ft_read.s
SRC			=	${addprefix ${DIR_SRC}, ${LST_SRC}}


#	==============================	OBJ	==============================	#
DIR_OBJ		= 	.obj/
LST_OBJ		=	${LST_SRC:.s=.o}
OBJ			=	${addprefix ${DIR_OBJ}, ${LST_OBJ}}


#	==============================	TEST	==============================	#
DIR_TEST		=	test/
LST_TEST_SRC	=	main.c utils.c strlen.c strcpy.c strcmp.c strdup.c write.c read.c
TEST_SRC		=	${addprefix ${DIR_TEST}, ${LST_TEST_SRC}}


LST_TEST_OBJ	=	${LST_TEST_SRC:.c=.o}
TEST_OBJ		=	${addprefix ${DIR_OBJ}, ${LST_TEST_OBJ}}



#	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	RULES	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	#
.PHONY: all clean fclean
#	==============================	BASE	==============================	#
all: ${TEST_EXE}


clean:
	@rm -rf ${DIR_OBJ}
	@echo "Clean"

fclean: clean
	@rm -f ${NAME}
	@rm -f ${TEST_EXE}
	@echo "FClean"

re: fclean all


#	==============================	COMPILATION	==============================	#
${NAME}: ${DIR_OBJ} ${OBJ}
	${AR} ${ARFLAG} $@ ${OBJ}

${DIR_OBJ}%.o: ${DIR_SRC}%.s
	${ASM} ${ASMFLAG} ${DEPFLAG} $< -o $@

-include ${DIR_OBJ}/*.dep


#	==============================	UTILS	==============================	#
${DIR_OBJ}:
	@mkdir ${DIR_OBJ}


#	==============================	TEST	==============================	#
${TEST_EXE}:	${NAME} ${TEST_OBJ}
	${CC} ${IFLAG} ${CFLAG} ${TEST_OBJ}  libasm.a -o ${TEST_EXE} 

${DIR_OBJ}%.o:	${DIR_TEST}%.c
	${CC} ${IFLAG} ${CFLAG} -c $< -o $@


# end
