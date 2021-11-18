#!/usr/bin/python3

import argparse
import os

envs = ['test', 'dev', 'prod']
actions = ['init', 'apply', 'destroy']


def get_args():
    parser = argparse.ArgumentParser()

    parser.add_argument('-e', '--env', help=f'environment - choose one of: {envs}', choices=envs, required=True)
    parser.add_argument('-i', '--tf-input-dir', help='directory containing terraform files', required=True)
    parser.add_argument('-a', '--action', help='action - choose one of: {actions}', choices=actions, required=True)
    parser.add_argument('-f', '--force', help='auto approve', action='store_true', required=False)
    return parser.parse_args()


if __name__ == '__main__':
    args = get_args()
    auto_approve = '--auto-approve' if (args.force and args.action != 'init') else ''
    working_directory = os.path.join(args.tf_input_dir, args.env)
    print(f'\n--- Environment: {args.env}\n--- Action: {args.action}\n--- Working Directory: {working_directory}')

    tf_cmd = f'terraform -chdir={working_directory} {args.action} {auto_approve}'
    print(f'\n--- Running: {tf_cmd}\n')
    os.system(tf_cmd)
    print(f'\n--- Finished!\n--- Command: {tf_cmd}\n--- Arguments: {args.__dict__}\n')
