#!/usr/bin/env python3
import sys
import json

import os
import subprocess


from operator import itemgetter 

DOCKER_COMMAND = "docker run -it %s -v '$HOME/.private:/work/.private' -v '$HOME/bin/:/work/bin' -v '$HOME/vpn/:/work/vpn' -v '$HOME/.ssh:/work/.ssh' -v '$HOME/.aws:/work/.aws' --dns 8.8.8.8 --privileged efazati/tizi"

class Handy:
    
    HANDY_PATH = os.path.expanduser('~/.private/handy.json')

    def __init__(self, path=None):
        self.data = []

        self.handy_path = path or self.HANDY_PATH
        self.data_stack = self.load_data_stack(self.handy_path)

    def load_data_stack(self, path):
        json_file = open(path)
        return json.load(json_file)

    def main_menu(self):
        printing_items = []
        data_stack_with_rank = []
        sorted_data_stack_with_rank = []
        # sorted_data_stack = sorted(data_stack, key=lambda k: ("rank" not in k, int(k.get("rank", 0))))
        for item in self.data_stack:
            txt = '{:10s}\t{:40s}\t{:10s}'.format(item['type'], item['name'], item['category'])
            data_stack_with_rank.append({"rank":item.get("rank", 0), "txt":txt})
        sorted_data_stack_with_rank = sorted(data_stack_with_rank, key=itemgetter('rank'), reverse = True)
        for item in sorted_data_stack_with_rank:
            printing_items.append(item['txt'])
        print('\n'.join(printing_items))

    def increase_rank(self, requested_item):
        rank = self.data_stack[self.data_stack.index(requested_item)].get("rank", 0)
        self.data_stack[self.data_stack.index(requested_item)]['rank'] = rank + 1
        with open(self.handy_path, 'w') as outfile:
            json.dump(self.data_stack, outfile)

    def open_ssh(self, requested_item):
        ssh_host = requested_item['user']+"@"+requested_item['host']
        tags = requested_item.get('requirements', '').split(",")
        envs = f"-e SSH_HOST='{ssh_host}'"  
        use_docker = False
        if 'vpn' in tags:
            use_docker = True
            envs = envs + " -e USE_VPN='true'"
        if 'wg' in tags:
            use_docker = True
            envs = envs + " -e USE_WG='true'"
        if 'vault' in tags:
            use_docker = True
            envs = envs + " -e USE_VAULT='true' -e VAULT_FOLDER='" + requested_item['vault'] + "'"

        # ssh_command = "--entrypoint /work/bin/ssh_over_vpn.sh "+ envs + DOCKER_COMMAND
        ssh_command = DOCKER_COMMAND % ("--entrypoint /work/bin/ssh_over_vpn.sh "+ envs)
        if use_docker:
            command = "/usr/bin/urxvt -e sh -c \""+ssh_command+";fish\"" 
        else:
            command = "/usr/bin/urxvt -e sh -c \"ssh -o 'ConnectionAttempts 20' -v "+ssh_host+";fish\"" 
        p = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    def open_path(self, requested_item):
        command = "/usr/bin/urxvt -e sh -c \"cd "+requested_item['path']+";fish\"" 
        p = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    def open_url(self, requested_item):
        command = "xdg-open " + requested_item['host']
        p = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    def open_saving_clipboard(self, requested_item):
        command = "echo " +requested_item['txt'] + " | xclip -selection c"
        p = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    def open_command(self, requested_item):
        command = requested_item['txt']
        p = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    def debug(self):
        ssh_command = DOCKER_COMMAND % ("--entrypoint /bin/bash")
        command = "/usr/bin/urxvt -e sh -c \""+ssh_command+";fish\"" 
        p = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    def command_parser(self, command):
        # item_type = command.split("#")[0].strip()
        # name = command.split("#")[1].strip()
        item_type = command.split("\t")[0].strip()
        name = command.split("\t")[1].strip()
        requested_item = next(row for row in self.data_stack if row["name"]==name and row["type"]==item_type)
        
        if item_type == "ssh":
            self.open_ssh(requested_item)

        elif item_type == "path":
            self.open_path(requested_item)

        elif item_type == "url" or item_type == "repo":
            self.open_url(requested_item)
        
        elif item_type == "clipboard":
            self.open_saving_clipboard(requested_item)

        elif item_type == "command":
            self.open_command(requested_item)

        elif item_type == "debug":
            self.debug()

        self.increase_rank(requested_item)
        sys.exit(0)
        return      

if __name__ == "__main__":
    args = sys.argv
    handy = Handy()
    if len(args) > 1:
        handy.command_parser(args[1])
    else:
        handy.main_menu()
