defaults-distribute
=========

Данная роль осуществляет первичную настройку станций, включаюшую:
- Распространение файла /etc/hosts для внутреннего разрешения имен в пределах VPC;
- присвоение переменных среды для работы с http и https proxy;
- установка временной зоны;
- установка и запуск node-exporter для взаимодействия с системой мониторинга.

