#!/bin/bash
__create_user() {
  # Create a user to SSH into as.
  useradd panev
  SSH_USERPASS=newpass
  echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin panev)
  echo ssh panev password: $SSH_USERPASS
}

__add_user_to_sudoers() {
  echo "user ALL=(ALL:ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)
}

# Call all functions
__create_user
__add_user_to_sudoers