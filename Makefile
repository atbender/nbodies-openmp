CXX= g++
LINK = $(CXX) -lpthread
EXE = nbody_simulation
CXXFLAGS = -O0 -std=c++11 -fopenmp

#CXXFLAGS += -g -DVERBOSE

SRC = $(wildcard *.cpp)
OBJ = $(SRC:.cpp=.o)

OBJ_ROOT = nbody.o 

SMALL = input_files/nbody_input-16384_16384.in
BIG = input_files/nbody_input-32768_32768.in
PATIENCE = This might take a while... Maybe use this opportunity to grab a coffee?
DONE = All done! The log reports can be found in the logs subdirectory.

# If the first argument is "run"...
ifeq (run,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

# If the first argument is "run-small"...
ifeq (run-small,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

# If the first argument is "run-big"...
ifeq (run-big,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif



default: $(EXE)

$(EXE): $(OBJ) $(OBJ_ROOT)
	$(LINK) $(OBJ) $(CXXFLAGS) -o $@

%.o: %.cpp 
	$(CXX) $(CXXFLAGS) -c $<

.PHONY: run, run-small, run-big, run-full-all, run-full-small, run-full-big

run : $(EXE)
	./$(EXE) $(RUN_ARGS)

run-small : $(EXE)
	./$(EXE) $(SMALL) $(RUN_ARGS)

run-big : $(EXE)
	./$(EXE) $(BIG) $(RUN_ARGS)

run-full-small : $(EXE)
	@echo $(PATIENCE) && rm -rf logs/*.txt && ./$(EXE) $(SMALL) 1 > logs/log_small_1_thread.txt && ./$(EXE) $(SMALL) 2 > logs/log_small_2_thread.txt && ./$(EXE) $(SMALL) 4 > logs/log_small_4_thread.txt && ./$(EXE) $(SMALL) 8 > logs/log_small_8_thread.txt && ./$(EXE) $(SMALL) 16 > logs/log_small_16_thread.txt && ./$(EXE) $(SMALL) 32 > logs/log_small_32_thread.txt
	@echo $(DONE)
	
run-full-big : $(EXE)
	@echo $(PATIENCE) && rm -rf logs/*.txt && ./$(EXE) $(BIG) 1 > logs/log_big_1_thread.txt && ./$(EXE) $(BIG) 2 > logs/log_big_2_thread.txt && ./$(EXE) $(BIG) 4 > logs/log_big_4_thread.txt && ./$(EXE) $(BIG) 8 > logs/log_big_8_thread.txt && ./$(EXE) $(BIG) 16 > logs/log_big_16_thread.txt && ./$(EXE) $(BIG) 32 > logs/log_big_32_thread.txt
	@echo $(DONE)

run-full-all : $(EXE)
	@echo $(PATIENCE) && rm -rf logs/*.txt && ./$(EXE) $(SMALL) 1 > logs/log_small_1_thread.txt && ./$(EXE) $(SMALL) 2 > logs/log_small_2_thread.txt && ./$(EXE) $(SMALL) 4 > logs/log_small_4_thread.txt && ./$(EXE) $(SMALL) 8 > logs/log_small_8_thread.txt && ./$(EXE) $(SMALL) 16 > logs/log_small_16_thread.txt && ./$(EXE) $(SMALL) 32 > logs/log_small_32_thread.txt && ./$(EXE) $(BIG) 1 > logs/log_big_1_thread.txt && ./$(EXE) $(BIG) 2 > logs/log_big_2_thread.txt && ./$(EXE) $(BIG) 4 > logs/log_big_4_thread.txt && ./$(EXE) $(BIG) 8 > logs/log_big_8_thread.txt && ./$(EXE) $(BIG) 16 > logs/log_big_16_thread.txt && ./$(EXE) $(BIG) 32 > logs/log_big_32_thread.txt
	@echo $(DONE)

clean:
	rm -rf *.o $(EXE)

clean-o:
	rm -rf *.o

clean-logs:
	rm -rf logs/*.txt


