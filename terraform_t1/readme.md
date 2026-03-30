Чистая ВМ ubuntu 22.04 установил docker + docker compose<br> 
<img width="958" height="49" alt="image" src="https://github.com/user-attachments/assets/3aeac1f9-ead7-45c9-8dd6-d81415fb8fda" /><br>
<img width="715" height="57" alt="image" src="https://github.com/user-attachments/assets/20d7f0ca-d41b-4f61-afde-5f6055559d53" /><br>
клонировал репозиторий посмтотре файл main.tf, попытался запустить terraform init не отработал .terraformrc - в папке проекта, скоприовал в домашнюю папку<br> 
<img width="1578" height="789" alt="image" src="https://github.com/user-attachments/assets/2e120a29-bc97-45ff-9b66-a1559786bf97" /><br>
запустил по новой <br>
<img width="1476" height="744" alt="image" src="https://github.com/user-attachments/assets/d0e09587-4674-4f52-ab12-093b3e0f6456" /><br>
запустил файл проекта <br>
<img width="1438" height="721" alt="image" src="https://github.com/user-attachments/assets/47e00e71-9c6c-431a-b602-41ac0e768c8b" /><br>
Q3.получили генерированный пароль<br> 
<img width="858" height="613" alt="image" src="https://github.com/user-attachments/assets/ff9e8bc0-dbc0-495a-be0c-5fb5c9ad6775" /><br>
---
Q2.В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?<br>
# own secret vars store<br>
personal.auto.tfvars <- тут<br> 
---
Q4.
faa@home-work-terraform:~/ter-homeworks/01/src$ terraform validate
╷<br>
│ Error: Missing name for resource<br>
│<br>
│   on main.tf line 23, in resource "docker_image":<br>
│   23: resource "docker_image" {<br>
│<br>
│ All resource blocks must have 2 labels (type, name).  <- говорит что должно быть тип и имя, у нас только первая часть <br>
 исправим примерно так -  resource "docker_image" "nginx" {<br>
│ Error: Invalid resource name
│
│   on main.tf line 28, in resource "docker_container" "1nginx":
│   28: resource "docker_container" "1nginx" {  <- ошибка тут 
│
│ A name must start with a letter or underscore and may contain only letters, digits, underscores, and dashes. тут написано что начало только с буквы или _
для исправления уберем цифру - resource "docker_container" "nginx" {







