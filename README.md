
# 4-Bit Binary Up Counter Using T Flip-Flops 

<p align="center">
  <b>RTL Design | Sequential Logic | Functional Verification</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Language-Verilog-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Design-Sequential%20Logic-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Simulation-RTL-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Waveform-VCD-purple?style=for-the-badge" />
</p>

## 1. Project Overview

This project implements a **4-bit binary up counter using T (Toggle) Flip-Flops** in Verilog Hardware Description Language (HDL).

A binary up counter is a sequential digital circuit that increments its binary count by one on every active clock event.

The design consists of four T Flip-Flops connected in a cascaded configuration to generate a 4-bit binary counting sequence from `0000` to `1111`.

An active-high synchronous reset is used to initialize the counter to zero.

The design is verified using a Verilog testbench, and simulation waveforms are generated in VCD format for functional analysis.

## 2. Design Specifications

| Parameter | Description |
|---|---|
| Design Name | 4-Bit Binary Up Counter |
| Design Type | Sequential Circuit |
| Counter Type | Binary Up Counter |
| Flip-Flop Type | T Flip-Flop |
| Number of Flip-Flops | 4 |
| Clock | Positive Edge Triggered |
| Reset | Active-High Synchronous Reset |
| Counter Width | 4 Bits |
| Counting Range | 0 to 15 |
| HDL | Verilog |
| Waveform Format | VCD |

## 3. Working Principle

The 4-bit binary up counter consists of four T Flip-Flops connected in a cascaded configuration.

Each T Flip-Flop toggles its output when its T input is HIGH at the active clock edge.

### 3.1 T Flip-Flop Operation

A T Flip-Flop has two possible operations depending on the T input.

| T Input | Next State |
|---|---|
| 0 | No Change |
| 1 | Toggle |

**Characteristic Equation:**

`Q_next = T ^ Q`

Where:

- `T` represents the toggle input.
- `Q` represents the present state.
- `Q_next` represents the next state.
- `^` represents the XOR operation.

### 3.2 Counter Architecture

The counter uses four T Flip-Flops:

- **TFF0:** Toggles on every positive edge of the main clock.
- **TFF1:** Uses the inverted output of `q[0]` as its clock.
- **TFF2:** Uses the inverted output of `q[1]` as its clock.
- **TFF3:** Uses the inverted output of `q[2]` as its clock.

All four T inputs are connected to logic HIGH (`1'b1`).

The inverted clock connections create the required toggling sequence for binary up-counting.

### 3.3 Counting Sequence

The counter generates the following 4-bit binary sequence:

| Decimal | Binary Output |
|:---:|:---:|
| 0 | 0000 |
| 1 | 0001 |
| 2 | 0010 |
| 3 | 0011 |
| 4 | 0100 |
| 5 | 0101 |
| 6 | 0110 |
| 7 | 0111 |
| 8 | 1000 |
| 9 | 1001 |
| 10 | 1010 |
| 11 | 1011 |
| 12 | 1100 |
| 13 | 1101 |
| 14 | 1110 |
| 15 | 1111 |

After reaching `1111`, the counter rolls over to `0000`.

## 4. RTL Module Description

The project consists of the following Verilog modules:

| Module | Functionality |
|---|---|
| `tff` | Implements a T Flip-Flop with synchronous reset |
| `binary_4bit_upcnt` | Connects four T Flip-Flops to implement a 4-bit up counter |
| `binary_4bit_upcnt_tb` | Testbench for functional verification |

### 4.1 T Flip-Flop Module

The T Flip-Flop is implemented using positive-edge-triggered sequential logic.

**Features:**

- Positive-edge-triggered operation.
- Active-high synchronous reset.
- Toggle operation when T = 1.
- State retention when T = 0.

**Characteristic Equation:**

`Q_next = T ^ Q`

### 4.2 4-Bit Binary Up Counter Module

Four T Flip-Flops are instantiated to construct the 4-bit counter.

The connections are:

| Flip-Flop | T Input | Clock Input |
|---|---|---|
| TFF0 | 1 | `clk` |
| TFF1 | 1 | `~q[0]` |
| TFF2 | 1 | `~q[1]` |
| TFF3 | 1 | `~q[2]` |

Each flip-flop toggles at the appropriate clock transition to generate the binary counting sequence.

## 5. Repository Structure

```text
4-bit-binary-up-counter/
│
├── binary_4bit_upcnt.v
│   └── T Flip-Flop and counter RTL modules
│
├── binary_4bit_upcnt_tb.v
│   └── Verilog testbench
│
├── screenshots/
│   └── simulation_waveform.png
│
├── README.md
│
└── .gitignore
```

## 6. Functional Verification

A Verilog testbench is developed to verify the functionality of the 4-bit binary up counter.

The testbench performs the following operations:

1. Initializes the clock to LOW.
2. Applies an active-high reset.
3. Deasserts reset after 10 ns.
4. Generates a periodic clock with a 10 ns time period.
5. Monitors the counter output.
6. Generates a VCD waveform file.
7. Terminates the simulation after 200 ns.

### 6.1 Testbench Parameters

| Parameter | Value |
|---|---|
| Initial Clock | 0 |
| Initial Reset | 1 |
| Reset Deassertion | 10 ns |
| Clock Period | 10 ns |
| Clock Frequency | 100 MHz |
| Simulation Duration | 200 ns |
| Waveform File | `4bitbinaryupcnt.vcd` |

### 6.2 Expected Simulation Output

After reset is deasserted, the counter starts incrementing.

```text
Time=10 Reset=0 Count=0000
Time=20 Reset=0 Count=0001
Time=30 Reset=0 Count=0010
Time=40 Reset=0 Count=0011
Time=50 Reset=0 Count=0100
Time=60 Reset=0 Count=0101
Time=70 Reset=0 Count=0110
Time=80 Reset=0 Count=0111
Time=90 Reset=0 Count=1000
Time=100 Reset=0 Count=1001
```

The counter continues incrementing until it reaches `1111`, after which it rolls over to `0000`.

## 7. Simulation and Waveform Generation

The Verilog design can be compiled and simulated using Icarus Verilog or Synopsys VCS.

### 7.1 Compilation Using Icarus Verilog

```bash
iverilog -o counter_sim binary_4bit_upcnt.v binary_4bit_upcnt_tb.v
```

### 7.2 Run Simulation

```bash
vvp counter_sim
```

### 7.3 Generate VCD Waveform

The testbench includes the following commands:

```verilog
$dumpfile("4bitbinaryupcnt.vcd");
$dumpvars(0,binary_4bit_upcnt_tb);
```

These commands generate a VCD waveform file containing the simulation signals.

### 7.4 View Waveform Using GTKWave

```bash
gtkwave 4bitbinaryupcnt.vcd
```

The waveform viewer can be used to inspect the clock, reset, and 4-bit counter output.

## 8. Waveform Analysis

The simulation waveform can be analyzed to verify the sequential behavior of the counter.

The following signals are observed:

| Signal | Width | Description |
|---|---:|---|
| `clk` | 1 bit | Main clock signal |
| `rst` | 1 bit | Active-high synchronous reset |
| `q[0]` | 1 bit | Least Significant Bit |
| `q[1]` | 1 bit | Second counter bit |
| `q[2]` | 1 bit | Third counter bit |
| `q[3]` | 1 bit | Most Significant Bit |
| `q[3:0]` | 4 bits | Complete counter output |

Waveform analysis helps verify:

- Proper synchronous reset operation.
- Toggle behavior of individual T Flip-Flops.
- Binary incrementing sequence.
- Correct clock transition behavior.
- Counter rollover from `1111` to `0000`.

## 9. Tools and Technologies

| Tool / Technology | Purpose |
|---|---|
| Verilog HDL | RTL design implementation |
| Icarus Verilog | Compilation and simulation |
| Synopsys VCS | RTL simulation |
| GTKWave | Waveform visualization |
| VCD | Simulation waveform database |
| Git | Version control |
| GitHub | Source code hosting |

## 10. Key Learning Outcomes

Through this project, the following concepts are explored:

- Sequential digital circuit design.
- T Flip-Flop operation and characteristic equations.
- XOR operation in digital logic.
- Synchronous reset implementation.
- Positive-edge-triggered sequential logic.
- Cascaded flip-flop connections.
- 4-bit binary up-counting operation.
- Verilog module instantiation.
- Testbench development.
- RTL simulation and waveform analysis.
- VCD waveform generation.

## 11. Future Enhancements

Potential extensions to this project include:

- Designing 8-bit and 16-bit binary up counters.
- Implementing binary down counters.
- Developing up/down counters.
- Designing synchronous counters using a common clock.
- Implementing counters using JK and D Flip-Flops.
- Adding enable control functionality.
- Performing RTL synthesis and timing analysis.

## 12. Author

**SANTHOSH KUMAR N A**

RTL Design | Digital Electronics | VLSI Engineering

- GitHub: [Your GitHub Profile](https://github.com/your-username)
- LinkedIn: [Your LinkedIn Profile](https://linkedin.com/in/your-profile)

## 13. License

This project is intended for educational and learning purposes.

You are welcome to explore, modify, and extend the implementation with appropriate attribution.

---

<p align="center">
  <b>Designed with Verilog HDL | Verified through RTL Simulation</b>
</p>

<p align="center">
  ⭐ If you find this project useful, consider starring the repository!
</p>

---

## GitHub Topics

verilog · binary-up-counter · t-flip-flop · sequential-circuit · digital-design · rtl-design · vlsi · verilog-hdl · digital-electronics · counter-design · waveform-analysis · hardware-design

