
# loading my custom binaries

if [[ -d ~/.svic321/bin ]]; then
  export PATH=$PATH:~/.svic321/bin
fi
# path for python binaries
if [[ -d ~/.local/bin ]]; then
  export PATH=$PATH:~/.local/bin
fi

# SSH_ENV="$HOME/.ssh/agent-environment"

# function start_agent {
#     echo "Initialising new SSH agent..."
#     /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"$SSH_ENV"
#     echo succeeded
#     chmod 600 "$SSH_ENV"
#     . "$SSH_ENV" >/dev/null
#     /usr/bin/ssh-add; 
# }
#
# # Source SSH settings, if applicable
#
# if [ -f "$SSH_ENV" ]; then
#     . "$SSH_ENV" >/dev/null
#     #ps $SSH_AGENT_PID doesn't work under Cygwin
#     ps -ef | grep $SSH_AGENT_PID | grep ssh-agent$ >/dev/null || {
#         start_agent
#     } 
# else
#     start_agent 
# fi
#
SSH_ENV="$HOME/.ssh/agent-environment"

start_ssh_agent() {
  echo "Starting new ssh-agent..."
  ssh-agent -s | sed 's/^echo/#echo/' > "$SSH_ENV"
  chmod 600 "$SSH_ENV"
  source "$SSH_ENV"
}

if [ -f "$SSH_ENV" ]; then
  source "$SSH_ENV" > /dev/null
  if ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
    start_ssh_agent
  fi
else
  start_ssh_agent
fi

