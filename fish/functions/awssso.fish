# SSO login to AWS and set AWS_PROFILE env var if successful
function awssso
    aws sso login --profile $argv[1]; and set -gx AWS_PROFILE $argv[1]
end
