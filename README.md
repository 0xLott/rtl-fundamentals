# SystemVerilog Study Projects

A set of hardware design projects and testbenches for learning SystemVerilog fundamentals.

## Directory structure

```
├── logic_gate_playground/
│   ├── src/
│   ├── tb/
│   └── dumps/
├── seven_segment_display/
│   ├── src/
│   ├── tb/
│   └── dumps/
├── .../
│   ├── src/
│   ├── tb/
│   └── dumps/
└── README.md
```

---

## Quick Start

For any project, follow these steps:

### 1. Compile
```bash
cd <project_name>
iverilog -g2012 -o simv src/*.sv tb/*.sv
```

### 2. Run
```bash
vvp simv
```

### 3. View Waveforms
```bash
gtkwave dumps/*.vcd
```

--- 

## Projects

### 1. Logic Gate Playground
**Location:** `logic_gate_playground/`
* **Task:** Create a module with two inputs ($A, B$) and several outputs that show the result of `AND`, `OR`, `XOR`, and `NAND` simultaneously.
* **Topics:** The `assign` statement (continuous assignment) and how wires work.
* **Testbench:** Cycles through all four binary input combinations ($00, 01, 10, 11$) with immediate assertions that verify correct outputs.

### 2. 7-Segment Display Decoder
**Location:** `seven_segment_display/`
* **Task:** Create a module that takes a 4-bit binary input (representing numbers 0–9) and outputs a 7-bit signal to light up a standard 7-segment LED display.
* **Topics:** The `always_comb` block and `case` statements. Hardware is basically just a giant lookup table for this project.
* **Testbench:** Force an "Error" state if the input is greater than 9 (hexadecimal A–F).

### 3. 4-Bit Binary Counter
**Location:** `binary_counter/`
* **Task:** Create a module with a `clk` and `reset` input. Every time the clock ticks, the 4-bit output should increment by 1 ($0000 \rightarrow 0001 \rightarrow ... \rightarrow 1111 \rightarrow 0000$).
* **Topics:** The `always_ff @(posedge clk)` block and the difference between non-blocking (`<=`) and blocking (`=`) assignments.
* **Testbench:** Create a clock generator in your testbench: `always #5 clk = ~clk;`.

### 4. RGB LED Controller (PWM)
**Location:** `pwm_rgb_led/`
* **Task:** Build a module that turns a digital signal on and off so fast that the human eye perceives it as "dimming." Use a counter to control the "on-time" versus "off-time."
* **Topics:** Controlling hardware timing and "duty cycles."
* **Testbench:** Check the waveform to see if your signal is "High" for 25% of the time and "Low" for 75%.

### 5. Simple Finite State Machine (FSM): Traffic Light
**Location:** `traffic_light_fsm/`
* **Task:** Model a traffic light that stays Green for 30 cycles, Yellow for 5, and Red for 20.
* **Topics:** State transitions. You'll define states using `typedef enum`: `GREEN`, `YELLOW`, `RED`.
* **Testbench:** Add a "Pedestrian Button" input that forces the light to transition to Yellow/Red faster.
