#include ../../common/make.config
#For NVML
ARCH  := $(shell getconf LONG_BIT)

ifeq ($(ARCH),$(filter $(ARCH),32 64))
	NVML_LIB := /home/lou/nvml/usr/src/gdk/nvml/lib/
else
	$(error Unknown architecture!)
endif

NVMLSRC = percounter.cu
NVMLFLAGS := -I /home/lou/nvml/usr/include/nvidia/gdk/ -I /home/lou/sassifi/suites/rodinia_3.1/cuda/bfs/
LDFLAGS := -lnvidia-ml -L $(NVML_LIB)

#For bfs
TARGET = bfs
SUITE_NAME = rodinia_3.1

OPTION = none

GENCODE = -gencode arch=compute_37,code=sm_37 -gencode arch=compute_50,code=sm_50

#SASSIFI_HOME, INST_LIB_DIR, CCDIR, and CUDA_BASE_DIR should be set

#SASSI/CUDA
CUDA_LIB_DIR = $(CUDA_BASE_DIR)/lib64
CUDA_BIN_DIR = $(CUDA_BASE_DIR)/bin
CUPTI_LIB_DIR = $(CUDA_BASE_DIR)/extras/CUPTI/lib64
CUPTI = -L$(CUPTI_LIB_DIR) -lcupti
NVCC = $(CUDA_BIN_DIR)/nvcc

# The C/CPP compiler you want to use, and associated flags.
CC = gcc
CXX = g++
CFLAGS = -O3
CXXFLAGS = -O3
export PATH := $(CCDIR)/bin/:$(PATH)
export LD_LIBRARY_PATH := $(CCDIR)/lib64:$(LD_LIBRARY_PATH):$(CUDA_LIB_DIR):$(CUPTI_LIB_DIR)

AFTER_RED = -Xptxas --sassi-inst-after="reg-writes"
AFTER_MEM = -Xptxas --sassi-inst-after="memory"
AFTER_REG_MEM = -Xptxas --sassi-inst-after="reg-writes\,memory"
BEFORE_ALL = -Xptxas --sassi-inst-before="all"
BEFORE_COND_BRANCHES = -Xptxas --sassi-inst-before="cond-branches"
BEFORE_REG_MEM = -Xptxas --sassi-inst-before="reg-writes\,memory"

AFTER_REG_INFO = -Xptxas --sassi-after-args="reg-info"
AFTER_MEM_INFO = -Xptxas --sassi-after-args="mem-info"
AFTER_REG_MEM_INFO = -Xptxas --sassi-after-args="reg-info\,mem-info"
BEFORE_COND_BRANCH_INFO = -Xptxas --sassi-before-args="cond-branch-info"
BEFORE_REG_MEM_INFO = -Xptxas --sassi-before-args="reg-info\,mem-info"

BRANCH_AROUND = -Xptxas --sassi-iff-true-predicate-handler-call

ifeq ($(OPTION),profiler)
EXTRA_NVCC_FLAGS = $(BEFORE_ALL) $(BEFORE_REG_MEM_INFO)
EXTRA_LINK_FLAGS = $(CUPTI) -L$(INST_LIB_DIR) -lprofiler
endif

ifeq ($(OPTION),inst_value_injector)
EXTRA_NVCC_FLAGS = $(AFTER_REG_MEM) $(AFTER_REG_MEM_INFO) $(BRANCH_AROUND)
EXTRA_LINK_FLAGS = $(CUPTI) -L$(INST_LIB_DIR) -linstvalueinjector
endif

ifeq ($(OPTION),inst_address_injector)
EXTRA_NVCC_FLAGS = $(AFTER_REG_MEM) $(AFTER_REG_MEM_INFO) $(BRANCH_AROUND) $(BEFORE_REG_MEM) $(BEFORE_REG_MEM_INFO)
EXTRA_LINK_FLAGS = $(CUPTI) -L$(INST_LIB_DIR) -linstaddressinjector
endif

ifeq ($(OPTION),rf_injector)
EXTRA_NVCC_FLAGS = $(BEFORE_ALL) $(BEFORE_REG_MEM_INFO)
EXTRA_LINK_FLAGS = $(CUPTI) -L$(INST_LIB_DIR) -lrfinjector
endif


NVCC_FLAGS = -O3 -g -rdc=true -Xptxas -v -I$(CUDA_BASE_DIR)/include/ $(EXTRA_NVCC_FLAGS)
LINK_FLAGS = -std=c++11 -g $(GENCODE) -lcudart -lcudadevrt -lm $(EXTRA_LINK_FLAGS)

all: clean $(TARGET) install

$(TARGET):
	$(NVCC) -o bfs bfs.cu $(NVMLSRC) $(NVCC_FLAGS) -L$(CUDA_LIB_DIR) $(LINK_FLAGS) $(NVMLFLAGS) $(LDFLAGS)

install:
	mkdir -p $(SASSIFI_HOME)/bin/$(OPTION)/$(SUITE_NAME)/
	cp $(TARGET) $(SASSIFI_HOME)/bin/$(OPTION)/$(SUITE_NAME)/

test:
	./bfs $(SASSIFI_HOME)/suites/$(SUITE_NAME)/data/bfs/graph1MW_6.txt

golden:
	./bfs $(SASSIFI_HOME)/suites/$(SUITE_NAME)/data/bfs/graph1MW_6.txt >golden_stdout.txt 2>golden_stderr.txt
	cp result.txt golden_result.txt

clean:
	rm -f *.o *~ bfs result.txt


clobber: clean
	rm -f sassifi-inst-counts.txt golden* *_regcount.p stdout* stderr*






# For rodinia
#CC := $(CUDA_DIR)/bin/nvcc

#INCLUDE := $(CUDA_DIR)/include

#SRC = bfs.cu

#EXE = bfs

#release: $(SRC)
#	$(CC) $(SRC) -o $(EXE) -I$(INCLUDE) -L$(CUDA_LIB_DIR) 

#enum: $(SRC)
#	$(CC) -deviceemu $(SRC) -o $(EXE) -I$(INCLUDE) -L$(CUDA_LIB_DIR) 

#debug: $(SRC)
#	$(CC) -g $(SRC) -o $(EXE) -I$(INCLUDE) -L$(CUDA_LIB_DIR) 

#debugenum: $(SRC)
#	$(CC) -g -deviceemu $(SRC) -o $(EXE) -I$(INCLUDE) -L$(CUDA_LIB_DIR) 

#clean: $(SRC)
#	rm -f $(EXE) $(EXE).linkinfo result.txt

#===================


