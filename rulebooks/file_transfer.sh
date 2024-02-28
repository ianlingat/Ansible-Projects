#!/bin/bash
#Christian Arth Lingat
#PTF File Transfer Script
while getopts u:p:r:t:f: flag
do
    case "${flag}" in
	u) user_name=${OPTARG};;
        p) ptf_dir=${OPTARG};;
        r) repo_server=${OPTARG};;
        t) target_servers=${OPTARG};;
	f) ptf_file=${OPTARG};;
    esac
done
echo "Username: $user_name";
echo "Repo Server: $ptf_dir";
echo "PTF Directory: $repo_server";
echo "Target Servers: $target_servers";
echo "Chosen PTF Files in a directory (* = ALL File in the PTF Directory): $ptf_file"

for i in $target_servers
do

	ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $user_name@$repo_server -- scp -p /home/$user_name/PTF/$ptf_dir/$ptf_file $user_name@$i:/home/$user_name/PTF/$ptf_dir/

done

