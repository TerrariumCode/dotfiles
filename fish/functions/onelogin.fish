function onelogin

  # Onelogin username/email
  set ONELOGIN_USERNAME "colin.macrae@hearst.co.uk"

  # The location to the onelogin python git repo
  set ONELOGIN_DIR "/Users/cmacrae/repos/onelogin-python-aws-assume-role"

  # The session duration in seconds
  # 1hr = 3600, 12hr = 43200
  set SESSION_DURATION "43200"
  # SESSION_DURATION="3600"

  set CURR_DIR $(pwd)
  set CURR_VENV $VIRTUAL_ENV

  set -e AWS_PROFILE
  set -e AWS_SECRET_ACCESS_KEY
  set -e AWS_ACCESS_KEY_ID
  set -e AWS_SESSION_TOKEN
  set -e AWS_DEFAULT_REGION

  cd $ONELOGIN_DIR
  if set -q $CURR_VENV
    deactivate
  end
  source $ONELOGIN_DIR/.venv/bin/activate.fish

   # --onelogin-app-id "2010731" \  # intl
  python src/onelogin/aws-assume-role/aws-assume-role.py \
    --onelogin-username {$ONELOGIN_USERNAME} \
    --onelogin-subdomain "hearstmagazinesuk" \
    --profile "onelogin" \
    --onelogin-app-id "2000889" \
    --aws-region "us-east-1" \
    --duration {$SESSION_DURATION}

  export AWS_PROFILE=onelogin
  export AWS_ACCESS_KEY_ID="$(cat {$HOME}/.aws/credentials | printSection "onelogin" | perl -n -e'/^aws_access_key_id = (.+)$/ && print $1')"
  export AWS_SECRET_ACCESS_KEY="$(cat {$HOME}/.aws/credentials | printSection "onelogin" | perl -n -e'/^aws_secret_access_key = (.+)$/ && print $1')"
  export AWS_SESSION_TOKEN="$(cat {$HOME}/.aws/credentials | printSection "onelogin" | perl -n -e'/^aws_session_token = (.+)$/ && print $1')"

  deactivate

  cd $CURR_DIR
  if set -q $CURR_VENV
    source $CURR_VENV/bin/activate.fish
  end

end

function printSection
  # read aws credential file by sections
  set section $argv[1]
  set found false
  while read line
    if {$found} == false; and string match $line "[{$section}]"
      continue
    else if {$found} == true; and string match $line[1] '['
        break
    end
    set found true
    echo {$line}
  end
end
