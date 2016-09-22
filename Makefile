CROSS   := mips-linux-gnu-
CFLAGS  := -Iinclude -Wall -O2 -mips32r2 -mmxu
LIBS 	:= -L. -ljpeg-hw -L../external/libjpeg-turbo/.libs  -ljpeg

OBJS := main.o		\
	misc.o		\
	signal.o	\
	convert_soft.o \
	raw/saveraw.o	\
	bmp/savebmp.o	\
	jpg/savejpeg.o	\
	lcd/framebuffer.o	\
	cim/cim_fmt.o	\
	cim/video.o	\
	cim/process.o	\
	cim/convert.o	\
	cim/regs.o	\
	cim/scale.o	\
	cim/preview_display.o

cimutils: $(OBJS)
	$(CROSS)gcc $^ $(LIBS) -o $@

.c.o:
	$(CROSS)gcc $(CFLAGS) -c $< -o $@

.PHONY:clean
clean:
	rm -rf $(OBJS) cimutils
