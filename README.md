
# Libasm

An introduction project to assembly

The goals is to rewrite somes functions in pure 64 bits ASM 

# Requirements
- use Intel syntax
- 64 bits assembly
- use nasm as compiler
- no inline asm (do `.s` files)
- forbidden to use `-no-pie` compilation flag
- library must be called libasm.a
- a test main should be present
- check for error after syscall and set errno properly (use of `___error` or `errno_location`)

# Mandatory
Each functions should behave the same as their libc counterpart (see man 3 and man 2 for read/write)

Call to malloc authorized for strdup

```c
size_t  ft_strlen(const char *s);
char *  ft_strcpy(char *restrict dst, const char *restrict src);
int     ft_strcmp(const char *s1, const char *s2);
char *  ft_strdup(const char *s);
ssize_t ft_write(int fd, const void* buf, size_t count);
ssize_t ft_read(int fd, void* buf, size_t count);
```


# Bonus
Struct used for ft_list_* :
```c
typedef struct s_list
{
    void            *data;
    struct s_list   *next;
}   t_list;
```
Theses functions should behave the same as the one from piscine (day04 and day12)

```c
int     ft_atoi_base(char *str, char *base);

t_list *ft_create_elem(void *data);
void    ft_list_push_front(t_list **begin_list, void *data);
int     ft_list_size(t_list *begin_list);
void    ft_list_sort(t_list **begin_list, int (*cmp)());
void    ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
```


## Tests

Insteed of a simple test main, tests are done using [LeadWasp](https://github.com/titi-rex/leadwasp_libasm_tester) which is not included in this repo



## References

- [Hello world in 64-bits ASM](https://p403n1x87.github.io/getting-started-with-x86-64-assembly-on-linux.html)

- [Good concrete introduction in 32-bits ASM + notions about stack](https://beta.hackndo.com/assembly-basics/)

- [Good asm introduction in 32-bits ASM (x86_32)](https://web.archive.org/web/20120822144129/http://www.cin.ufpe.br/%7Eif817/arquivos/asmtut/index.html)


- [Excellent short introduction on 64-bits ASM (x86_64)](https://aaronbloomfield.github.io/pdr/book/x86-64bit-asm-chapter.pdf)

- [Excellent explanation of the 'Calling Convention'](https://aaronbloomfield.github.io/pdr/book/x86-64bit-ccc-chapter.pdf)


- [Some history about registers names](https://www.crockford.com/x64.html)

