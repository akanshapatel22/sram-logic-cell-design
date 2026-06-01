# Custom SRAM & Logic Cell Design (180nm CMOS)

Design and simulation of 6T-SRAM cells, logic gates, and arithmetic units
in 180nm CMOS technology using Cadence and Synopsys Design Compiler, with
detailed timing, power, and leakage analysis to optimize area and energy
efficiency.

## Overview

This project covers transistor-level design and simulation of fundamental
digital components in 180nm CMOS. It demonstrates understanding of semiconductor
device physics, static timing analysis, power optimization techniques, and
VLSI design flows — skills directly applicable to SoC design and firmware
optimization roles at semiconductor companies.

## Features

- 6T-SRAM cell design with read/write stability analysis
- Basic logic gates (INV, NAND, NOR, XOR) at transistor level
- Arithmetic units (Half Adder, Full Adder, Ripple Carry Adder)
- Static Timing Analysis (STA) for setup and hold time verification
- Power analysis — dynamic, static, and leakage power breakdown
- Area optimization through transistor sizing

## Technical Details

| Parameter | Details |
|---|---|
| **Technology** | 180nm CMOS |
| **Tools** | Cadence Virtuoso, Synopsys Design Compiler |
| **Simulation** | SPICE-level transient and DC analysis |
| **HDL** | VHDL / Verilog |
| **Analysis** | Timing, Power, Leakage, Area |

## Project Structure
sram-logic-cell-design/
├── sram/
│   ├── sram_6t.vhd        # 6T-SRAM cell VHDL model
│   └── sram_tb.vhd        # Testbench for SRAM read/write
├── logic/
│   ├── gates.vhd          # Basic logic gates
│   └── gates_tb.vhd       # Testbench for logic gates
├── arithmetic/
│   ├── adder.vhd          # Half adder and full adder
│   └── adder_tb.vhd       # Testbench for adders
├── reports/
│   └── timing_power.md    # Timing and power analysis results
└── README.md

## Key Concepts Demonstrated

- **6T-SRAM Cell:** Six transistor SRAM design with separate read/write
  paths for stability. SNM (Static Noise Margin) analysis for read/write
  stability verification
- **Transistor Sizing:** Width/Length ratio optimization for speed vs
  power tradeoff in critical paths
- **Static Timing Analysis:** Setup time, hold time, and propagation delay
  verification across PVT corners
- **Power Optimization:** Clock gating and power gating techniques to
  reduce dynamic and leakage power
- **Design Compiler Flow:** RTL synthesis, technology mapping, and area/
  power/timing constraint satisfaction

## Tools & Environment

- Cadence Virtuoso (Schematic & Layout)
- Synopsys Design Compiler (Synthesis)
- SPICE Simulator
- ModelSim (HDL Simulation)
- 180nm CMOS PDK

## Skills Demonstrated

`VHDL` `Verilog` `CMOS` `SRAM Design` `Logic Design` `Arithmetic Circuits`
`Static Timing Analysis` `Power Analysis` `Cadence` `Synopsys` `VLSI`
`180nm Technology` `Transistor Sizing` `Leakage Optimization`
