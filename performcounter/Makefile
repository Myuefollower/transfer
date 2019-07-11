ARCH   := $(shell getconf LONG_BIT)

ifeq (${ARCH},$(filter ${ARCH},32 64))
   NVML_LIB := /home/lou/nvml/usr/src/gdk/nvml/lib/
else
   $(error Unknown architecture!)
endif
NVCC = nvcc
target = main
src = percounter.cu main.cu
CFLAGS  := -I ../include -I /home/lou/nvml/usr/include/nvidia/gdk/ -I /home/lou/performcounter/
LDFLAGS := -lnvidia-ml -L $(NVML_LIB)
$(target): $(src) 
	$(NVCC)  $(CFLAGS) $(LDFLAGS) -o $(target) $(src) 

clean:
	-@rm -f percounter.o
	-@rm -f percounter
