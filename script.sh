#!/bin/bash

create_users() {
  echo "Creating users..."
  for user in 'carlos' 'maria' 'joao' 'debora' 'sebastiana' 'roberto' 'josefina' 'amanda' 'rogerio'
  do
    useradd ${user} -m -s /bin/bash -p $(openssl passwd -crypt 12345)
    passwd -e ${user}
  done
  echo "Users created successfully!"
}

delete_users() {
  echo "Deleting users..."
 for user in 'carlos' 'maria' 'joao' 'debora' 'sebastiana' 'roberto' 'josefina' 'amanda' 'rogerio'
  do
    userdel ${user} -r -f
  done
  echo "Users deleted successfully!"
}

create_groups(){
  echo "Creating groups..."
  for group in 'grp_adm' 'grp_ven' 'grp_sec'
  do
    groupadd ${group}
  done
  echo "Groups created successfully!"
}

delete_groups(){
  echo "Deleting groups..."
  for group in 'grp_adm' 'grp_ven' 'grp_sec'
  do
    groupdel ${group}
  done
  echo "Groups deleted successfully!"
}

create_directories() {
  echo "Creating directories..."
  for directory in 'publico' 'adm' 'ven' 'sec'
  do
    mkdir /${directory}
  done
  echo "Directories create successfully!"
}

delete_directories() {
 echo "Deleting directories..."
  for directory in 'publico' 'adm' 'ven' 'sec'
  do
    rm -rf /${directory}
  done
  echo "Directories deleted successfully!"

}

reset() {
  echo "Deleting users, groups and directories..."
  delete_directories
  delete_users
  delete_groups
  echo "Reset done successfully!"
}

reset

create_users
create_groups
create_directories

# Associate users with grp_adm
for user in 'carlos' 'maria' 'joao'
do
  usermod -G grp_adm ${user}
done

# # Associate users with grp_ven
for user in 'debora' 'sebastiana' 'roberto'
do
 usermod -G grp_ven ${user}
done

# # Associate users with grp_sec
for user in 'josefina' 'amanda' 'rogerio'
do
 usermod -G grp_sec ${user}
done

# # Change the permissions on /publico directory
chmod 777 /publico

# # change the permissions and group of /adm directory
chown -c root:grp_adm /adm
chmod 770 /adm

# # change the permissions and group of /ven directory
chown -c root:grp_ven /ven
chmod 770 /ven

# # change the permissions and group of /sec directory
chown -c root:grp_sec /sec
chmod 770 /sec

