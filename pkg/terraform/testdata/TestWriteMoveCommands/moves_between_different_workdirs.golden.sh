terraform -chdir="/path/to/workdir1" state pull > "/path/to/workdir1/tfautomv-local-copy.tfstate"
cp "/path/to/workdir1/tfautomv-local-copy.tfstate" "/path/to/workdir1/tfautomv-backup-1690213514.tfstate"
terraform -chdir="/path/to/workdir2" state pull > "/path/to/workdir2/tfautomv-local-copy.tfstate"
cp "/path/to/workdir2/tfautomv-local-copy.tfstate" "/path/to/workdir2/tfautomv-backup-1690213514.tfstate"
terraform state mv -state="/path/to/workdir1/tfautomv-local-copy.tfstate" -state-out="/path/to/workdir2/tfautomv-local-copy.tfstate" "aws_instance.foo" "aws_instance.bar"
terraform -chdir="/path/to/workdir1" state push "tfautomv-local-copy.tfstate"
terraform -chdir="/path/to/workdir2" state push "tfautomv-local-copy.tfstate"
