Task_1
Q4. 
ОШибки:
platform_id = "standar**t**-v**4**"   надо standard-v1
cores       = 1 постаил 2! при развороте выдало ошибку Error: Error while requesting API to create instance: client-request-id =  client-trace-id =  rpc error: code = InvalidArgument desc = the specified number of cores is not available on platform "standard-v1"; allowed core number: 2, 4
memory      = 1 ! тут поставил 2 
Q6.
preemptible = true — прерываемая ВМ
core_fraction = 5 — гарантированная доля CPU 5%
<img width="1613" height="446" alt="image" src="https://github.com/user-attachments/assets/9aee5c65-8f30-4e85-bf6b-eaebcf0f2e4c" />
<img width="576" height="61" alt="image" src="https://github.com/user-attachments/assets/d32f552f-acfd-4e53-a178-8528c1d9910c" />


