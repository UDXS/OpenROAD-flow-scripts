export DESIGN_NICKNAME = microwatt
export DESIGN_NAME = microwatt
export PLATFORM    = sky130hd

export VERILOG_FILES_BLACKBOX = ./designs/src/$(DESIGN_NICKNAME)/IPs/*.v
export VERILOG_FILES = $(sort $(wildcard ./designs/src/$(DESIGN_NICKNAME)/*.v \
                       $(VERILOG_FILES_BLACKBOX)))

export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export DIE_AREA   = 0 0 2920 3520
export CORE_AREA  = 10 10 2910 3510

export PLACE_DENSITY ?= 0.25

export microwatt_DIR = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)

export ADDITIONAL_GDS  = $(wildcard $(microwatt_DIR)/gds/*.gds.gz)

export ADDITIONAL_LEFS  = $(wildcard $(microwatt_DIR)/lef/*.lef)

export ADDITIONAL_LIBS = $(wildcard $(microwatt_DIR)/lib/*.lib)

export SYNTH_HIERARCHICAL = 1
export RTLMP_FLOW = True

export RTLMP_BOUNDARY_WT = 0
export MACRO_PLACE_HALO = 100 100
export MACRO_PLACE_CHANNEL = 200 200

# Temporary
export SKIP_ANTENNA_REPAIR = 1

# CTS tuning
export CTS_BUF_CELL = sky130_fd_sc_hd__clkbuf_8
export CTS_BUF_DISTANCE = 600
#export CTS_CLUSTER_DIAMETER = 100
#export CTS_CLUSTER_SIZE = 30
export SKIP_GATE_CLONING = 1

export export SETUP_SLACK_MARGIN = 0.2

export GLOBAL_ROUTE_ARGS=-congestion_iterations 100 -verbose

# This is high, some SRAMs should probably be converted
# to real SRAMs and not instantiated as flops
export SYNTH_MEMORY_MAX_BITS ?= 42000