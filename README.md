# FSM-Controlled Datapath Design using Verilog HDL

## Project Overview

This project implements a simple FSM-controlled datapath architecture in Verilog HDL. The design integrates a Register File, Arithmetic Logic Unit (ALU), and FSM-based Controller to execute arithmetic operations and write the results back into the register file.

The objective of this project is to understand the fundamentals of RTL Design, Controller-Datapath Architecture, FSM Design, Register File Design, and Functional Verification using simulation.

---

## Features

✔ FSM-Based Controller

✔ 4 × 8-bit Register File

✔ Arithmetic Logic Unit (ALU)

✔ simplified Multi-Cycle Execution Flow

✔ Register Read and Write Operations

✔ Functional Verification using Testbench

✔ Waveform Analysis in Vivado Simulator

✔ Synthesizable Verilog RTL

---

## Architecture

### Datapath Block Diagram

> Insert Datapath Schematic Here

![Datapath Schematic](<img width="1328" height="472" alt="arch" src="https://github.com/user-attachments/assets/7dff84b9-f2da-42b8-a463-d79d7a2bd2a6" />
.png)

The datapath consists of:

- Register File
- ALU
- Controller (FSM)
- Read/Write Control Logic

The controller generates the required control signals for each stage of execution.

---

## FSM State Diagram

> Insert FSM State Diagram Here

![FSM State Diagram](<img width="427" height="639" alt="FSM" src="https://github.com/user-attachments/assets/d506dca7-4f3b-41c9-a055-8263b3a2ca8c" />
.png)


### State Description

| State | Function |
|---------|-----------|
| IDLE | Waits for enable signal |
| LOAD | Reads source operands from register file |
| EXECUTE | Performs ALU operation |
| WRITEBACK | Stores ALU result into destination register |
| DONE | Indicates completion and returns to IDLE |

---

## Module Description

### 1. ALU

The ALU performs arithmetic operations based on the opcode provided by the controller.

#### Supported Operations

| Opcode | Operation |
|----------|------------|
| 0000 | ADD |
| 0001 | SUB |
| 0010 | AND |
| 0011 | OR |
| 0100 | XOR |

---

### 2. Register File

#### Specifications

- 4 Registers
- 8-bit Data Width
- Dual Read Ports
- Single Write Port
- Synchronous Write
- Reset Support

#### Register Map

| Register | Address |
|-----------|----------|
| R0 | 00 |
| R1 | 01 |
| R2 | 10 |
| R3 | 11 |

---

### 3. Controller

The controller is implemented as a Finite State Machine (FSM).

Responsibilities:

- Control Register File Reads
- Control Register File Writes
- Select ALU Operation
- Manage Datapath Execution Sequence

---

## Verification Methodology

The design was verified using a Verilog testbench in Vivado Simulator.

### Testbench Flow

1. Apply Reset
2. Initialize Register Values
3. Apply Opcode
4. Assert Enable Signal
5. Observe FSM State Transitions
6. Verify ALU Result
7. Verify Register Writeback

---

# Test Case 1 : ADD Operation- R2 = R0 + R1

## Objective

Verify ADD operation and writeback functionality.

### Initial Register Values

```text
R0 = 10
R1 = 5
```

### Applied Opcode

```text
Opcode = 0000 (ADD)
```

### Simulation Waveform

> Insert Waveform Screenshot Here


![ADD Waveform](<img width="1914" height="714" alt="WAVE2" src="https://github.com/user-attachments/assets/dba16006-0098-4d16-9e38-3b4fd3b6e22b" />
.png)


### Observed Result

```text
R0 = 10
R1 = 5
R2 = 15
```

### Status

✅ PASS

---

# Test Case 2 : ADD Operation- R0 = R1 + R2

## Objective

Verify addition operation and writeback functionality.

### Initial Register Values

```text
R0 = 10
R1 = 5
```

### Applied Opcode

```text
Opcode = 0000 (ADD)
```

### Expected Result

```text
R2 = R0 + R1
R2 = 10 + 5
R2 = 15
```

### Simulation Waveform

> Insert Waveform Screenshot Here
Test verification

![ADD Waveform](<img width="1914" height="714" alt="WAVE2" src="https://github.com/user-attachments/assets/dba16006-0098-4d16-9e38-3b4fd3b6e22b" />
.png)



### Observed Result

```text
R0 = 10
R1 = 5
R2 = 15
```

### Status

✅ PASS

---

## Simulation Output

![consle](<img width="477" height="410" alt="OUTPUT" src="https://github.com/user-attachments/assets/db96a55f-dd08-483b-8293-744c9351b4cc" />
.png)

## RTL Design Flow

```text
RTL Coding
      ↓
Functional Simulation
      ↓
Waveform Analysis
      ↓
FSM Verification
      ↓
Result Validation
```

---

## Learning Outcomes

Through this project, I gained hands-on experience in:

- Verilog HDL
- RTL Design Methodology
- Controller-Datapath Architecture
- FSM Design
- Register File Design
- ALU Design
- Functional Verification
- Waveform Debugging
- Vivado Simulator

---

## Future Enhancements

Planned improvements include:

- AND Operation
- OR Operation
- XOR Operation
- Shift Operations
- Status Flags (ZF, CF, OF, SF)
- Instruction Decoder
- Immediate Data Support
- Parameterized Register File
- Multi-Cycle Processor Design
- Self-Checking Testbench


---

## Tools Used

- Verilog HDL
- Xilinx Vivado Simulator
- GitHub

---

## Repository Structure

```text
fsm-controlled-datapath-verilog/
│
├── rtl/
│   ├── alu.v
│   ├── register.v
│   ├── controller.v
│   └── top.v
│
├── tb/
│   └── tb.v
│
├── docs/
│   ├── datapath_schematic.png
│   ├── fsm_state_diagram.png
│   ├── test1_add_waveform.png
│   └── test2_sub_waveform.png
│
├── README.md
└── LICENSE
```

---

## Author

### Gandla Srivinay

B.Tech (ECE) | Aspiring RTL Design Engineer

Currently learning and building projects in:

- RTL Design
- Digital Design
- FPGA Design
- Verilog HDL
- VLSI Design
