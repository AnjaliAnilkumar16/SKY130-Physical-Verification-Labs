# SKY130-Physical-Verification-Labs
This repository documents a hands-on Physical Verification workshop using the open-source SKY130 Process Design Kit (PDK). Over multiple learning modules, participants explore industry-standard verification methodologies required before IC fabrication, including Design Rule Checking (DRC), Layout Versus Schematic (LVS) verification, parasitic extraction, hierarchy management, GDSII generation, density verification, antenna checks, and Electrical Rule Checking (ERC).
 
The workshop combines theoretical concepts with practical implementation using Magic VLSI, Netgen, OpenLane, and SKY130. Each module includes verification workflows, command references, debugging techniques, screenshots, and analysis of verification reports. The repository demonstrates how layout data is validated for manufacturability, connectivity correctness, and tapeout readiness while providing exposure to real-world physical verification practices used in semiconductor design and PDK development.
 
The materials cover extraction methodologies, parasitic capacitance analysis, hierarchy handling, CIF/GDS generation, density and fill verification, CMP-aware design considerations, antenna effects, ERC validation, and tapeout sign-off concepts, preparing learners for roles in Physical Verification, Design Enablement, PDK Development, and Custom Layout Engineering.


Banner Image]



## 📚 Table of Contents

- [Day 1 - Introduction to SKY130 and Open Source Tools](#day-1---introduction-to-sky130-and-open-source-tools)

- [Day 2 - DRC and LVS Theory and Labs](#day-2---drc-and-lvs-theory-and-labs)

- [Day 3 - Front-End and Back-End Verification Concepts](#day-3---front-end-and-back-end-verification-concepts)

- [Day 4 - OpenLane and Physical Verification Flow](#day-4---openlane-and-physical-verification-flow)

- [Day 5 - Running LVS and Debugging](#day-5---running-lvs-and-debugging)
 
## 🛠️ Tools Used
 
 
| Category | Tool | Purpose |
|----------|------|----------|
| PDK | SKY130A | Open-source Process Design Kit |
| Layout Editor | Magic VLSI | Layout creation, DRC and extraction |
| LVS Tool | Netgen | Layout Versus Schematic verification |
| Physical Design | OpenLane | RTL-to-GDSII automated flow |
| Simulator | NGSPICE | Circuit simulation and analysis |
| Operating System | Ubuntu Linux | Development environment |
| Version Control | Git & GitHub | Source control and documentation |
---

# Day 1 - Introduction to SKY130 and Open Source Tools

###  PV_D1SK1 - Introduction to SkyWater PDKs and opensource EDA tools

<details>
<summary><b>L1 - Introduction to Skywater PDK</b></summary>

PDK (Process Design Kit) = a collection of files provided by a semiconductor foundry that tells EDA tools how to design and verify circuits for a specific technology node.

It typically contains:
- Design Rules (DRC) → minimum width, spacing, enclosure, etc. 
- Device Definitions → NMOS, PMOS, resistors, capacitors. 
- PCells → parameterized layout cells. 
- LVS Decks → compare schematic vs layout. 
- Extraction Rules (PEX) → extract parasitics (R, C). 
- Technology Files → layer definitions, colors, display settings.

- 
Skywater 130 PDK : Open source PDK from google. Here we have open source PDK, which consists of 
Documentation: https://skywater-pdk -- 136.org.readthedocs.build

PDK Library and files https://github.com/google/skywater-pdk
If one needs to be a part of the community, you can join the same like Community slack https://join.skywater.tools

</details>

<details>
<summary><b>L2 - Opensource EDA Tools</b></summary>

<img width="679" height="373" alt="image" src="https://github.com/user-attachments/assets/1da4244d-3d5d-4464-8597-0df2511e5592" />


Basically, the open source PDK repository shows here takes the Skywater 130 PDK. It clones skywater 130 PDK to here. 


The open source tools supported by open PDKs are: 


1.	magic : Magic is an open-source VLSI layout editor used for layout design, DRC, and extraction.
2.	KLayout: KLayout is used for viewing, editing, and verifying IC layouts
3.	OpenLane: OpenLane automates the complete digital ASIC flow from RTL to GDS
4.	Xschem: xschem is used for schematic entry and netlist generation.
5.	Netgen: Netgen checks whether the layout matches the schematic
6.	Ngspice: ngspice is used to simulate circuit behavior before fabrication
7.	Qflow: Qflow is an open-source RTL-to-GDS digital design flow
8.	IRSIM: IRSIM performs transistor-level digital logic simulation.
9.	XCircuit: XCircuit is a schematic drawing and netlist-generation tool

<img width="940" height="508" alt="image" src="https://github.com/user-attachments/assets/cc934c81-b177-45d6-a31f-061f5206d94f" />


</details>

<details>
<summary><b>L3 - Understanding Skywater PDK – Layers</b></summary>

At every point of time for validation purposes, we need to know about layers used inside the whole PDK for debugging. The layers used inside the sky water PDK are;

<img width="940" height="505" alt="image" src="https://github.com/user-attachments/assets/751ec99e-8e64-4968-974c-e88188393c0f" />

Titanium nitride has high resistance. So it is used during the initial stages only. 

<img width="747" height="544" alt="image" src="https://github.com/user-attachments/assets/f8efd3ca-da2b-403b-b571-d9e88ed40e01" />

This figure shows the front-end layers of the SKY130 process, i.e., the layers used to build the transistor and make the first level of connections before Metal1.

1. N-well
•	Region where PMOS transistors are built. 
•	Created inside the p-type substrate.
2. P-well
•	Region where NMOS transistors are built. 
•	Used to isolate NMOS devices.
3. P-diffusion (P+ diffusion)
•	Source/drain region of a PMOS. 
•	Heavily doped P-type area inside the N-well.
4. N-diffusion (N+ diffusion)
•	Source/drain region of an NMOS. 
•	Heavily doped N-type area inside the P-well.
5. N-tap
•	N+ region inside N-well. 
•	Used to connect the N-well to VDD.
6. P-tap
•	P+ region inside P-well. 
•	Used to connect the P-well/substrate to GND.
7. Polysilicon (Poly)
•	Forms the transistor gate. 
•	When Poly crosses Active (Diffusion), a MOS transistor is created.
9. Local Interconnect (LI)
•	Titanium Nitride (TiN) routing layer. 
•	Used for short local connections near transistors. 
•	Exists between device layers and Metal1.

<img width="940" height="612" alt="image" src="https://github.com/user-attachments/assets/444538ef-d2b9-4b0f-96da-f4b719fcb27c" />

High Voltage Layer can resist higher voltage. If used under the gate as a gate oxide can bear upto a voltage of 5V in this PDK. 

<img width="940" height="627" alt="image" src="https://github.com/user-attachments/assets/ede974fc-36f0-422e-9169-c150b31f7e7f" />

This is a AI generated Image showing how MiM capacitors uses higher metal layer as the capacitor plates. 

<img width="732" height="588" alt="image" src="https://github.com/user-attachments/assets/50bc8ef5-b066-40ec-8892-4f6d320bfe77" />

<img width="940" height="560" alt="image" src="https://github.com/user-attachments/assets/a976121d-2f2d-433f-be5d-ff2cd79b1e16" />

AI generated image for Bump PAD.

<img width="940" height="627" alt="image" src="https://github.com/user-attachments/assets/240bdea6-3933-49b7-83ff-a0d8dac753c9" />

### Flip-Chip / WLCSP Packaging 

In traditional packaging, the chip is placed upright and connected to the package using thin gold wires. In Flip-Chip or WLCSP (Wafer Level Chip Scale Package), the chip is turned upside down so that its pads face the PCB directly. Small solder bumps are formed on the chip pads, allowing the chip to connect directly to the PCB without wire bonds. The signal path becomes much shorter:
Transistor → Metal Layers → Pad → RDL → UBM → Solder Bump → PCB
This results in lower resistance, lower inductance, better power delivery, higher speed, and a smaller package size. The RDL (Redistribution Layer) is used to reroute pad locations, while the UBM (Under Bump Metallization) provides a reliable surface for the solder bump to attach. WLCSP is commonly used in smartphones, wearables, IoT devices, and other space-constrained high-performance applications.

</details>

<details>
<summary><b>L4 - Understanding Skywater PDK – Devices</b></summary>

These are the different kinds of devices supported in skywater PDK. The basic structure is as follows:

<img width="709" height="600" alt="image" src="https://github.com/user-attachments/assets/fea4149b-9ec4-4453-bb56-d39a57be9711" />

<img width="744" height="509" alt="image" src="https://github.com/user-attachments/assets/ce8670ba-65e2-40e7-96de-8bceff36429a" />

<img width="735" height="545" alt="image" src="https://github.com/user-attachments/assets/a1bae8b9-6623-4d48-a149-84c14202da81" />

<img width="713" height="523" alt="image" src="https://github.com/user-attachments/assets/8f0d0cb8-83fc-4c40-981a-04c94fef14e3" />

<img width="940" height="282" alt="image" src="https://github.com/user-attachments/assets/3faf0ab7-8bae-462d-892e-4acf5df9d599" />

</details>

<details>
<summary><b>L5 - Understanding Skywater PDK Libraries</b></summary>

There re 3 types of Device Libraries in Skywater PDK.


1.	Digital Standard cells
This contains the standard cells gds and files which are used by the digital synthesis flows such as liberty,timing files, technology files, lef files, verilof & spice netlist.

<img width="940" height="774" alt="image" src="https://github.com/user-attachments/assets/7f0d6ee7-bea7-49b9-a658-0a4cbfa71fbf" />

_nor2_2 represents 2 input nor gate with relatively current density value equals 2. Its not a specific value it can be relative to others.

<img width="940" height="768" alt="image" src="https://github.com/user-attachments/assets/f7451f98-6694-4d60-b0e1-662241041b51" />

<img width="940" height="802" alt="image" src="https://github.com/user-attachments/assets/4a6d7a1d-8790-4465-87b9-bf710d04b2bf" />

An overlay cell is a layout-only cell, typically consisting of metal and via layers, that is placed on top of a base IO cell to create optional electrical connections such as pad-to-power or ESD-clamp-to-power connections. Overlay cells improve flexibility and reduce library complexity by allowing the same base IO cell to be reused in multiple configurations without creating separate cell variants.


</details>

<details>
<summary><b>L6 - Opensource Tools And Flows</b></summary>

<img width="940" height="451" alt="image" src="https://github.com/user-attachments/assets/91e4e4a7-8891-49b8-a5cb-33593924566d" />

The schematic will be formed from xschem. It is integrated with ngspice & gaw.

<img width="940" height="384" alt="image" src="https://github.com/user-attachments/assets/ba8d17d9-5d8a-4a03-984a-ad5349a9eb21" />

Layout is formed from generate(magic)
Steps to create the Layout
1.	Import the netlist of schematic in Layout tool.
2.	Then the layout has to be drc clean
3.	It has to be LVS clean

<img width="706" height="534" alt="image" src="https://github.com/user-attachments/assets/fc4b9396-1cb8-4f7a-b868-53c923f9205d" />

If these 2 netlists are equal, then LVS will be clean.


---

# Day 2 - DRC and LVS Theory and Labs



 
