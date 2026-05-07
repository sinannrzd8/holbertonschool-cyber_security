#!/bin/bash
grep -E '^(Include|KbdInteractiveAuthentication|UsePAM|X11Forwarding|PrintMotd|AcceptEnv|Subsystem|PasswordAuthentication|PermitRootLogin|AuthorizedKeysFile|TCPKeepAlive)' /etc/ssh/sshd_config
