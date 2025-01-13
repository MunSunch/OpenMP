.PHONY: clear single parallel both run_single run_parallel

LDFLAGS = -L/usr/local/opt/libomp/lib -lomp
CPPFLAGS_WITH_OPENMP = -std=c++11 -Xpreprocessor -fopenmp -I/usr/local/opt/libomp/include
CPPFLAGS_NO_OPENMP = -std=c++11 -Xpreprocessor -I/usr/local/opt/libomp/include
DFLAGS = -D${MODE} DEPS=${DEFINED_EPS}

SOURCE = src
TARGET = build
CC = clang++	
FILE = main

clear:
	@rm -rf build/*

single: clear
	@${CC} ${CPPFLAGS_NO_OPENMP} ${DFLAGS} ${SOURCE}/${FILE}.cpp -o ${TARGET}/${FILE}.out ${LDFLAGS}

parallel: clear
	@${CC} ${CPPFLAGS_WITH_OPENMP} ${DFLAGS} ${SOURCE}/${FILE}.cpp -o ${TARGET}/${FILE}.out ${LDFLAGS}

both: clear
	@echo "Single mode:"
	@${CC} ${CPPFLAGS_NO_OPENMP} -D_SINGLE_MODE ${DFLAGS} ${SOURCE}/${FILE}.cpp -o ${TARGET}/${FILE}.out ${LDFLAGS}
	${TARGET}/${FILE}.out
	@echo "Parallel mode:"
	@${CC} ${CPPFLAGS_WITH_OPENMP} -D_PARALLEL_MODE ${DFLAGS} ${SOURCE}/${FILE}.cpp -o ${TARGET}/${FILE}.out ${LDFLAGS}
	${TARGET}/${FILE}.out

run_single: single
	@echo "Running single mode..."
	${TARGET}/${FILE}.out

run_parallel: parallel
	@echo "Running parallel mode..."
	${TARGET}/${FILE}.out