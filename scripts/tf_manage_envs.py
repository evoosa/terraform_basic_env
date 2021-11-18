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
    return parser.parse_args()


if __name__ == '__main__':
    args = get_args()
    working_directory = os.path.join(args.tf_input_dir, args.env)
    print(f'\n--- Environment: {args.env}\n--- Action: {args.action}\n--- Working Directory: {working_directory}')
    os.system(f'terraform -chdir={working_directory} {args.action}')
    print(f'\n--- Finished!\nArguments: {args.__dict__}\n')