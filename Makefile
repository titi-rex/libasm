##
# libasm
#
# @file
# @version 0.1




NAME	=	test64

ASM		=	nasm
ASMFLAG	=	-f elf64
DEPFLAG	=	-MD $@.dep

LINKER	=	ld


#	==============================	SRC	==============================	#
DIR_SRC	=	src/
LST_SRC	=	ft_strlen.s 
			# test.s 
SRC		=	${addprefix ${DIR_SRC}, ${LST_SRC}}


#	==============================	OBJ	==============================	#
DIR_OBJ	= 	.obj/
LST_OBJ	=	${LST_SRC:.s=.o}
OBJ		=	${addprefix ${DIR_OBJ}, ${LST_OBJ}}



#	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	RULES	/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\/*\	#
.PHONY: all clean fclean
#	==============================	BASE	==============================	#
all: ${NAME}

clean:
	rm -rf ${DIR_OBJ}

fclean: clean
	rm ${NAME}

#	==============================	COMPILATION	==============================	#
${NAME}: ${DIR_OBJ} ${OBJ}
	ld -o ${NAME} ${OBJ}

${DIR_OBJ}%.o: ${DIR_SRC}%.s
	${ASM} ${ASMFLAG} ${DEPFLAG} $< -o $@


-include ${DIR_OBJ}/*.dep

#	==============================	UTILS	==============================	#
${DIR_OBJ}:
	mkdir ${DIR_OBJ}


# end
