#!/usr/bin/env python3

import subprocess
import json
import sys


def get_docker_stats():
    try:
        ps_cmd = subprocess.run(['docker', 'ps', '-q'],
                                capture_output=True, text=True)
        active_ids = ps_cmd.stdout.strip().split('\n')

        active_ids = [x for x in active_ids if x]
        count = len(active_ids)

        if count == 0:
            print(json.dumps(
                {"text": "󰡨 ", "tooltip": "Docker Offline / No Containers", "class": "offline"}))
            return

        stats_cmd = subprocess.run(['docker', 'stats', '--no-stream', '--format',
                                   '{{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}'], capture_output=True, text=True)

        tooltip_lines = ["<b>Docker Containers:</b>"]
        for line in stats_cmd.stdout.strip().split('\n'):
            if line:
                parts = line.split('\t')
                if len(parts) == 3:
                    name, cpu, mem = parts
                    tooltip_lines.append(f"📦 <b>{name}</b>:  {cpu} |  {mem}")

        tooltip_text = "\n".join(tooltip_lines)

        output = {
            "text": f"󰡨 {count}",
            "tooltip": tooltip_text,
            "class": "active"
        }
        print(json.dumps(output))

    except Exception as e:
        print(json.dumps(
            {"text": "󰡨 Err", "tooltip": str(e), "class": "error"}))


if __name__ == "__main__":
    get_docker_stats()
