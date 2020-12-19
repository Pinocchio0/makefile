#将inc中的.h和src中的.c编译到obj中的.o再输出a.out


inc_path = ./inc

MyArgs = -Wall -g

ALL:a.out
src = $(wildcard ./src/*.c)
obj = $(patsubst ./src/%.c, ./obj/%.o, $(src))
a.out: $(obj)
	gcc $^ -o $@ $(MyArgs)

$(obj):./obj/%.o:./src/%.c
	gcc -c $< -o $@ $(MyArgs) -I $(inc_path)

clean:
	-rm -rf $(obj) a.out

.PHONY:clean ALL
