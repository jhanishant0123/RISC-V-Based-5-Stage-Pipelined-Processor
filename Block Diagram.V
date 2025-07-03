Block diagram for the RISC-V Based-5 Stage-Pipelined-Processor is shown below :-  

flowchart LR
  PC --> IF
  IF --> IF_ID
  IF_ID --> ID
  ID --> ID_EX
  ID_EX --> EX
  EX --> EX_MEM
  EX_MEM --> MEM
  MEM --> MEM_WB
  MEM_WB --> WB
  ID -->|control signals| ControlUnit
  EX -->|forwarding| ForwardingUnit
  ID -->|hazard detection| HazardUnit



